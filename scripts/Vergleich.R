
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
                     remove_numbers = T)  %>% 
  tokens_remove(sw) %>% tokens_group(groups = organisation) %>% 
  dfm() %>% dfm_wordstem()

#calculate keyness (https://quanteda.io/articles/pkgdown/examples/plotting.html)
result_keyness <- textstat_keyness(corpus_dfm, target = "Arbeitnehmer")

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
#read in the Dictionaries (http://inhaltsanalyse-mit-r.de/sentiment.html)
load("data/Rauh_SentDictionaryGerman.RData")
sentiment.lexikon.rauh <- dictionary(list(positive = str_trim(sent.dictionary$feature[sent.dictionary$sentiment>0]),
                                          negative = str_trim(sent.dictionary$feature[sent.dictionary$sentiment<0])))



# sentiment pro organisation
meine_dfm_sentiment_org <- corpus_dfm %>% 
  dfm_lookup(dictionary = sentiment.lexikon.rauh)

meine_dfm_sentiment_org_prop <- dfm_weight(meine_dfm_sentiment_org, scheme = "prop")



# plot
sentiment.org <- convert(meine_dfm_sentiment_org_prop, "data.frame") %>% 
  gather(positive, negative, key = "Polarität", value = "Sentiment")

sentiment_plot <- ggplot(sentiment.org, aes(doc_id, Sentiment, colour = Polarität, fill = Polarität)) + 
  geom_bar(stat="identity") + scale_colour_brewer(palette = "Set1") + 
  scale_fill_brewer(palette = "Accent") + 
  ggtitle("Sentiment-Scores in den Zeitungen nach Verband") +
  xlab("") + ylab("Anteil") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# sentiment pro text
corpus_dfm_text <- tokens(corpus_combined, remove_punct = T, 
                          remove_symbols = T,
                          remove_numbers = T)  %>% 
  tokens_remove(sw) %>% 
  dfm() %>% dfm_wordstem() %>% dfm_lookup(dictionary = sentiment.lexikon.rauh)


