
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/stopwords.R")
tic("Vergleich")
load(file = "E:/R Projects/Daten_MA/Masterarbeit/data/TextArbeitszeit.rda")

Arbeitgeber_csv <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitgeber_Arbeitszeit.csv", encoding = "UTF-8")

#clean corpora
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\-\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\;\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\..\\s+", 
                                      replacement = " ", 
                                      x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\. .\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 

#create variable to seperate the corpora
Arbeitgeber_csv$organisation <- "Arbeitgeber"
TextArbeitszeit$organisation <- "Arbeitnehmer"

#create one object of both corpora objects
TextArbeitszeit$date <- as.character(TextArbeitszeit$date)
filter_Arbeitsnehmer <- TextArbeitszeit %>%  select(doc_id, text, date, organisation)
Arbeitgeber_csv$date <- as.character(Arbeitgeber_csv$date)
filter_Arbeitsgeber <- Arbeitgeber_csv %>% select(doc_id, complete_text, date, 
                                                  organisation) %>% rename(text = complete_text) 
                       
                        
all_texts <- bind_rows(filter_Arbeitsgeber, filter_Arbeitsnehmer)
#create corpus objects
corpus_Arbeitgeber <- corpus(Arbeitgeber_csv, text_field = "complete_text")
corpus_Arbeitnehmer <- corpus(TextArbeitszeit)

corpus_combined <- corpus_Arbeitgeber + corpus_Arbeitnehmer


#make a dfm
corpus_dfm <- tokens(corpus_combined, remove_punct = T, 
                     remove_symbols = T,
                     remove_numbers = T) %>% 
  tokens_remove(sw) %>% tokens_group(groups = organisation) %>% 
  dfm()

#calculate keyness (https://quanteda.io/articles/pkgdown/examples/plotting.html)
result_keyness <- textstat_keyness(corpus_dfm, target = "Arbeitgeber")

#plot
textplot_keyness(result_keyness)


#frequency (https://quanteda.io/articles/pkgdown/examples/plotting.html)
corpus_dfm_weight <- dfm_weight(x = corpus_dfm ,scheme = "prop")

freq_weight <- textstat_frequency(corpus_dfm_weight, n = 15,
                                  groups = corpus_dfm_weight@docvars$organisation)

ggplot(data = freq_weight, aes(x = nrow(freq_weight):1, y = frequency)) +
  geom_point() +
  facet_wrap(~ group, scales = "free") +
  coord_flip() +
  scale_x_continuous(breaks = nrow(freq_weight):1,
                     labels = freq_weight$feature) +
  labs(x = NULL, y = "Relative frequency")
toc()


#Sentiment Analysis
#read in the Dictionaries
positive_terms_all <- readLines("data/SentiWS_v2.0_Positive.txt")
negative_terms_all <- readLines("data/SentiWS_v2.0_Negative.txt")

#restrict the data to only words that occur in the text
positive_terms_in_suto <- intersect(colnames(corpus_dfm), positive_terms_all)
counts_positive <- rowSums(corpus_dfm[, positive_terms_in_suto])

negative_terms_in_suto <- intersect(colnames(corpus_dfm), negative_terms_all)
counts_negative <- rowSums(corpus_dfm[, negative_terms_in_suto])

#relativ numbers
counts_all_terms <- rowSums(corpus_dfm)

relative_sentiment_frequencies <- data.frame(
  positive = counts_positive / counts_all_terms,
  negative = counts_negative / counts_all_terms
)

sentiments_per_organisation <- aggregate(relative_sentiment_frequencies, by = list(organisation = all_texts$organisation), mean)

head(sentiments_per_organisation)