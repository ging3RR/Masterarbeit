##1st step
#prep----
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")


Arbeitgeber_csv <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/all_xml_exports.csv", encoding = "UTF-8")

summary(Arbeitgeber_csv)
Arbeitgeber_csv$text[1]

#create the textmeta----

#rename the text Variable to path to avoid confusion
Arbeitgeber_csv <- rename(.data = Arbeitgeber_csv, path = text )
#create date variable
Arbeitgeber_csv$date <- str_extract(string = Arbeitgeber_csv$path, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

Arbeitgeber_csv$date <- as.numeric(Arbeitgeber_csv$date)


#Kwic Analysis of Arbeitszeit----

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


##2nd step
#prep----
Arbeitgeber_csv <- readtext(file = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitgeber_Arbeitszeit.csv", encoding = "UTF-8")
#create an LDA package ready corpus ----

yrs <- Arbeitgeber_csv$date
yrs <- lubridate::ymd(yrs, truncated = 2L) #R cannot make a date variable with only a year, so make a dummy year variable
#source https://stackoverflow.com/questions/30255833/convert-four-digit-year-values-to-class-date

Arbeitgeber_csv$date <- yrs

# make the tosca corpus

corpus_tosca <- textmeta(meta = as.meta(x = Arbeitgeber_csv, 
                                        cols = colnames(Arbeitgeber_csv), 
                                        idCol = "doc_id",
                                        dateCol = "date", 
                                        titleCol = "path"),
                         dateFormat = "%Y-%m-%d",
                         text = Arbeitgeber_csv$complete_text)


#define stopwords  
sw<- c(tm::stopwords("german"), "dass")
#create clean corpus
tosca_corpus <- cleanTexts(object = corpus_tosca, sw = sw, ucp = T)
#somehow the cleanTexts() removes all meta, fill in the meta again
tosca_corpus$meta <- corpus_tosca$meta



#make wordlist
wordlist <- makeWordlist(tosca_corpus$text)

Corpus_Prototype <- LDAprep(text = tosca_corpus$text, vocab = wordlist$words, reduce = T)

#save(Corpus_Prototype, file = "Arbeitszeit_docs.rda") only run this once to save the files
#save(wordlist, file = "Arbeitszeit_vocab.rda") 


#use the LDAPrototpye function
names(Corpus_Prototype) = paste0("id", seq_along(Corpus_Prototype)) #to name the lists, otherwise the code cannot run

LDA_Prototype <- LDAPrototype(docs = Corpus_Prototype, vocabLDA = wordlist$words,
                              n = 5, seeds = 1:5, id = "first_try", K = 15)



#get the Prototype LDA
Prototype_LDA <- getLDA(LDA_Prototype)
#get the topics of the Prototype LDA
topics_Prototype <- getTopics(Prototype_LDA)
#see the n top words of the Prototype Topics
tosca::topWords(topics_Prototype, 5)


#trying the same with 30 repetitions --> so far minor differences
LDA_Prototype_30 <- LDAPrototype(docs = Corpus_Prototype, vocabLDA = wordlist$words,
                                 n = 30, seeds = 1:30, id = "first_try", K = 15)
Prototype_LDA_30 <- getLDA(LDA_Prototype_30)
topics_Prototype_30 <- getTopics(Prototype_LDA_30)

tosca::topWords(topics_Prototype_30, 5)


clustRes <- clusterTopics(ldaresult = Prototype_LDA, xlab = "Topic", ylab = "Distance")
clustRes <- clusterTopics(ldaresult = Prototype_LDA_30, xlab = "Topic", ylab = "Distance")