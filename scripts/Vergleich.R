
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/stopwords.R")

# full corpora ----
#Arbeitnehmer
load("E:/R Projects/Daten_MA/Masterarbeit/data/full_text.rds")
#create the textmeta
full_text$date <- str_extract(string = full_text$doc_id, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

full_text$date <- as.numeric(full_text$date)

full_text$id <- str_extract(string = full_text$doc_id, pattern = "[0][0-9][0-9][0-9]")# find the 4 number pattern with 0 in as first number = Id

full_text$id <- as.numeric(full_text$id)



#Arbeitgeber
Arbeitgeber_alle <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/all_xml_exports.csv", encoding = "UTF-8")


#create the textmeta

#rename the text Variable to path to avoid confusion
Arbeitgeber_alle  <- rename(.data = Arbeitgeber_alle , path = text )
#create date variable
Arbeitgeber_alle$date <- str_extract(string = Arbeitgeber_alle$path, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

Arbeitgeber_alle$date <- as.numeric(Arbeitgeber_alle$date)

#create variable to seperate the corpora
Arbeitgeber_alle$organisation <- "Arbeitgeber"
full_text$organisation <- "Arbeitnehmer"


#create one object of both corpora objects
full_text$date <- as.character(full_text$date)
full_text <- full_text %>%  select(doc_id, text, date, organisation)
Arbeitgeber_alle$date <- as.character(Arbeitgeber_alle$date)
Arbeitgeber_alle <- Arbeitgeber_alle %>% select(doc_id, complete_text, date, 
                                                  organisation) %>% rename(text = complete_text) 



#corpus
corpus_full_Arbeitgeber <- corpus(Arbeitgeber_alle, text_field = "text")
corpus_full_Arbeitnehmer <- corpus(full_text, text_field = "text")
#make a subcorpus with the right years
corpus_full_Arbeitgeber <- corpus_subset(corpus_full_Arbeitgeber, date >=1930)
corpus_full_Arbeitgeber <- corpus_subset(corpus_full_Arbeitgeber, date <=1970)

# combine corpus
corpus_full_combined <- corpus_full_Arbeitgeber + corpus_full_Arbeitnehmer



#store the Info in an object
tokenInfo_full <- summary(object = corpus_full_combined, n = 100000, showmeta = T)

#group by year and count the texts per year
tokenInfo_full2 <- tokenInfo_full %>%  group_by(date,organisation) %>% summarise(freq = n())
tokenInfo_full2$date <- as.integer(tokenInfo_full2$date)
tokenInfo_full2_df <- as.data.frame(tokenInfo_full2)

#plot the object
ggplot(data=tokenInfo_full2_df, aes(x = date, y = freq)) + geom_line() + geom_point() + 
  geom_smooth(method = NULL, level = 0.80, col="purple") +
  scale_x_continuous(labels = c(seq(1930, 1970, 5)), breaks = seq(1930, 1970, 5)) + 
  facet_grid(rows = vars(organisation), scales = "free_y") + theme_bw()

# Arbeitszeit Texte-----
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


# all_texts <- bind_rows(filter_Arbeitsgeber, filter_Arbeitsnehmer)

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

# pre and after WWII----

# make two corpora

pre_corpus <- corpus_subset(corpus_combined, date <= 1950) 
  
after_corpus <- corpus_subset(corpus_combined, date > 1950)

#dfm
pre_corpus_dfm <- tokens(pre_corpus, remove_punct = T, 
                     remove_symbols = T,
                     remove_numbers = T)  %>% 
  tokens_remove(sw) %>% tokens_group(groups = organisation) %>% 
  dfm() %>% dfm_wordstem()


after_corpus_dfm <- tokens(after_corpus, remove_punct = T, 
                         remove_symbols = T,
                         remove_numbers = T)  %>% 
  tokens_remove(sw) %>% tokens_group(groups = organisation) %>% 
  dfm() %>% dfm_wordstem()

# sentiment
# sentiment pro organisation
pre_corpus_sentiment <- pre_corpus_dfm %>% 
  dfm_lookup(dictionary = sentiment.lexikon.rauh)

pre_corpus_sentiment_prop <- dfm_weight(pre_corpus_sentiment, scheme = "prop")

after_corpus_sentiment <- after_corpus_dfm %>% 
  dfm_lookup(dictionary = sentiment.lexikon.rauh)

after_corpus_sentiment_prop <- dfm_weight(after_corpus_sentiment, scheme = "prop")

# plot pre
sentiment.org_pre <- convert(pre_corpus_sentiment_prop, "data.frame") %>% 
  gather(positive, negative, key = "Polarität", value = "Sentiment")

sentiment_plot_pre <- ggplot(sentiment.org_pre, aes(doc_id, Sentiment, colour = Polarität, fill = Polarität)) + 
  geom_bar(stat="identity") + scale_colour_brewer(palette = "Set1") + 
  scale_fill_brewer(palette = "Accent") + labs(subtitle = "Vor 1950") +
  ggtitle("Sentiment-Scores in den Zeitungen nach Verband") +
  xlab("") + ylab("Anteil") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# plot after
sentiment.org_after <- convert(after_corpus_sentiment_prop, "data.frame") %>% 
  gather(positive, negative, key = "Polarität", value = "Sentiment")

sentiment_plot_after <- ggplot(sentiment.org_after, aes(doc_id, Sentiment, colour = Polarität, fill = Polarität)) + 
  geom_bar(stat="identity") + scale_colour_brewer(palette = "Set1") + 
  scale_fill_brewer(palette = "Accent") + 
  ggtitle("Sentiment-Scores in den Zeitungen nach Verband") + labs(subtitle = "Nach 1950") +
  xlab("") + ylab("Anteil") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# sentiment pro jahr----

#dfm pro Organisation

meine.dfm.Arbeitnehmer <- tokens(corpus_Arbeitnehmer, remove_punct = T, 
                     remove_symbols = T,
                     remove_numbers = T)  %>% 
  tokens_remove(sw) %>%  
  dfm() %>% dfm_wordstem() %>% dfm_group(groups = date) %>% dfm_lookup(dictionary = sentiment.lexikon.rauh)

meine.dfm.Arbeitgeber <- tokens(corpus_Arbeitgeber, remove_punct = T, 
                                 remove_symbols = T,
                                 remove_numbers = T)  %>% 
  tokens_remove(sw) %>%  
  dfm() %>%  dfm_wordstem() %>% dfm_group(groups = date) %>% 
  dfm_lookup(dictionary = sentiment.lexikon.rauh) 




# sentiment pro Organisation
sentiment.Arbeitgeber.prop <- dfm_weight(meine.dfm.Arbeitgeber, scheme = "prop") %>% 
  convert("data.frame") %>%
  gather(positive, negative, key = "Polarität", value = "Sentiment") %>% 
  mutate(Organisation = "Arbeitgeber") %>% rename(date = doc_id) 

sentiment.Arbeitnehmer.prop <- dfm_weight(meine.dfm.Arbeitnehmer, scheme = "prop") %>% 
  convert("data.frame") %>%
  gather(positive, negative, key = "Polarität", value = "Sentiment") %>% 
  mutate(Organisation = "Arbeitnehmer") %>% rename(date = doc_id) 

# zusammenfügen und reskalieren
sentiment.beide <- bind_rows(sentiment.Arbeitgeber.prop, sentiment.Arbeitnehmer.prop) %>% 
  filter(Polarität == "positive") %>% 
  select(date, Organisation, Sentiment) %>% 
  mutate(Sentiment = rescale(Sentiment, to = c(-1,1))) %>%
  mutate(Organisation = as.factor(Organisation)) 

# data wrangling for date variable
sentiment.beide$date <- unlist(sentiment.beide$date)
sentiment.beide$date <- as.Date(sentiment.beide$date, format = "%Y")
# plot
ggplot(sentiment.beide , aes(date, Sentiment, colour = Organisation, group = Organisation)) + 
  geom_line() + 
  geom_hline(yintercept = 0, linetype = "dashed", color = "lightgray") + 
  geom_vline(xintercept =  as.numeric(lubridate::ymd("1950-01-01")), linetype = "dashed", color = "black") +
  scale_colour_brewer(palette = "Set1") + 
  scale_x_date(date_breaks = "6 years", date_labels = "%Y") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Verrechnete Sentiment-Scores für beide Verbände") + 
  xlab("Jahr") + facet_grid(rows = vars(Organisation))



