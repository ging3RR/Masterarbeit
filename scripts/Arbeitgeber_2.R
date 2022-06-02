#prep-----
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
Arbeitgeber_csv <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitgeber_Arbeitszeit.csv", encoding = "UTF-8")
##1st step Preparation of corpus----

#prep


Arbeitgeber_csv <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/all_xml_exports.csv", encoding = "UTF-8")

summary(Arbeitgeber_csv)
Arbeitgeber_csv$text[1]

#create the textmeta

#rename the text Variable to path to avoid confusion
Arbeitgeber_csv <- rename(.data = Arbeitgeber_csv, path = text )
#create date variable
Arbeitgeber_csv$date <- str_extract(string = Arbeitgeber_csv$path, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

Arbeitgeber_csv$date <- as.numeric(Arbeitgeber_csv$date)


#Kwic Analysis of Arbeitszeit

#make a corpus with quanteda
Arbeitgeber_corpus <- corpus(x = Arbeitgeber_csv, text_field = "complete_text")
summary(Arbeitgeber_corpus)
#make a subcorpus with the right years
Arbeitgeber_corpus_1930 <- corpus_subset(Arbeitgeber_corpus, date >=1930)
Arbeitgeber_corpus_1930 <- corpus_subset(Arbeitgeber_corpus_1930, date <=1970)
summary(Arbeitgeber_corpus_1930)

#tokenize---
Arbeitgeber_corpus_1930_token <- tokens(Arbeitgeber_corpus_1930, remove_punct = T, remove_symbols = T)

#kwic
Kwic_Arbeitgeber <- kwic(Arbeitgeber_corpus_1930_token, pattern = "Arbeitszeit")
Kwic_text_namen <- Kwic_Arbeitgeber$docname
Kwic_text_namen <- unique(Kwic_text_namen)

#filter the data frame according to the list
Arbeitgeber_Arbeitszeit_csv <- filter(.data = Arbeitgeber_csv, Arbeitgeber_csv$doc_id %in% Kwic_text_namen == TRUE)

#write the csv
write.csv(x = Arbeitgeber_Arbeitszeit_csv, file = "Arbeitgeber_Arbeitszeit.csv", fileEncoding = "UTF-8")




##2nd step Statistical Overview----
#create quanteda corpus
corpus_Arbeitgeber <- corpus(Arbeitgeber_csv, text_field = "complete_text")

#store the Info in an object
tokenInfo_Arbeitgeber <- summary(object = corpus_Arbeitgeber, n = 2500, showmeta = T)

#group by year and count the texts per year
token_Info2_Arbeitgeber<- tokenInfo %>% group_by(date) %>% summarise(freq = n()) 

#plot the object
ggplot(data=token_Info2_Arbeitgeber, aes(x = date, y = freq, group = 1)) + geom_line() + geom_point() +
  scale_x_continuous(labels = c(seq(1930, 1970, 5)), breaks = seq(1930, 1970, 5)) +
  theme_bw()

##3rd step LDA----
#remove all the whitespaces, words separated by - can now be tokenized as one word
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\-\\s+", 
                             replacement = "", 
                             x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\;\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\..\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 
Arbeitgeber_csv$complete_text <- gsub(pattern = "\\. .\\s+", 
                                      replacement = "", 
                                      x = Arbeitgeber_csv$complete_text) 
#create an LDA package ready corpus ----

yrs <- Arbeitgeber_csv$date
yrs <- lubridate::ymd(yrs, truncated = 2L) #R cannot make a date variable with only a year, so make a dummy year variable
#source https://stackoverflow.com/questions/30255833/convert-four-digit-year-values-to-class-date

Arbeitgeber_csv$date <- yrs

# make the tosca corpus

corpus_tosca_Arbeitgeber <- textmeta(meta = as.meta(x = Arbeitgeber_csv, 
                                        cols = colnames(Arbeitgeber_csv), 
                                        idCol = "doc_id",
                                        dateCol = "date", 
                                        titleCol = "path"),
                         dateFormat = "%Y-%m-%d",
                         text = Arbeitgeber_csv$complete_text)


#define stopwords  
sw<- c(tm::stopwords("german"), "dass")
#create clean corpus
tosca_corpus_Arbeitgeber <- cleanTexts(object = corpus_tosca_Arbeitgeber, sw = sw, ucp = T)
#somehow the cleanTexts() removes all meta, fill in the meta again
tosca_corpus_Arbeitgeber$meta <- corpus_tosca_Arbeitgeber$meta



#make wordlist
wordlist_Arbeitgeber <- makeWordlist(tosca_corpus_Arbeitgeber$text)

Corpus_Prototype_Arbeitgeber <- LDAprep(text = tosca_corpus_Arbeitgeber$text, vocab = wordlist_Arbeitgeber$words, reduce = T)

#save(Corpus_Prototype, file = "Arbeitszeit_docs.rda") only run this once to save the files
#save(wordlist, file = "Arbeitszeit_vocab.rda") 


#use the LDAPrototpye function
names(Corpus_Prototype_Arbeitgeber) = paste0("id", seq_along(Corpus_Prototype_Arbeitgeber)) #to name the lists, otherwise the code cannot run
#use tic toc to measure time
tic("LDA_Prototype")
LDA_Prototype_Arbeitgeber <- LDAPrototype(docs = Corpus_Prototype_Arbeitgeber, vocabLDA = wordlist_Arbeitgeber$words,
                              n = 15, seeds = 1:15, id = "first_try", K = 15, progress = TRUE)
toc()



#get the Prototype LDA
Prototype_LDA_Arbeitgeber <- getLDA(LDA_Prototype_Arbeitgeber)
#get the topics of the Prototype LDA
topics_Prototype_Arbeitgeber <- getTopics(Prototype_LDA_Arbeitgeber)
#see the n top words of the Prototype Topics
Topwords_Arbeitgeber <- tosca::topWords(topics_Prototype_Arbeitgeber, 5)

#cluster the results
clustRes_Arbeitgeber <- clusterTopics(ldaresult = Prototype_LDA_Arbeitgeber, xlab = "Topic", ylab = "Distance")



#topics over time 
#clean the date variable
tosca_corpus_Arbeitgeber$meta$date <- as.Date(tosca_corpus_Arbeitgeber$meta$date, "%Y-%m-%d")
#plot
plotTopic(object = tosca_corpus_Arbeitgeber, ldaresult = Prototype_LDA_Arbeitgeber, ldaID = names(Corpus_Prototype_Arbeitgeber),
          unit = "year",
          rel = TRUE, curves = "smooth", smooth = 0.1, legend = "none", ylim = c(0, 0.7))


