
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
#source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/Aussortieren.R")
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/stopwords.R")

#preprocessing / not needed anymore----

#read in data


pathArbeitszeit <- "E:/R Projects/Daten_MA/Masterarbeit/data/grs" # create an object with the path

Arbeitszeit_files <- str_c(pathArbeitszeit, Arbeitszeit, sep = "/") # string together the path and the file name


#import and pre cleaning


TextArbeitszeit <- readtext(Arbeitszeit_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, "[\n]", " ") # remove all new lines

TextArbeitszeit$text <- str_remove_all(TextArbeitszeit$text, pattern = "[\\d]") # remove all digits

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed(","), "") # remove all the kommas

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed("<EOS>"), "") # remove all End of Sentence

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed("<EOP>"), "") #remove all end of paragraph

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, fixed("¦°chlm"), "") # remove sonderzeichen

TextArbeitszeit$text <- str_replace_all(TextArbeitszeit$text, "[[:punct:]]", "") #remove all punctuation

TextArbeitszeit$text <- gsub(pattern = "\\¬ \\s+", replacement = "", x = TextArbeitszeit$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create the textmeta

TextArbeitszeit$date <- str_extract(string = TextArbeitszeit$doc_id, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

TextArbeitszeit$date <- as.numeric(TextArbeitszeit$date)

TextArbeitszeit$id <- str_extract(string = TextArbeitszeit$doc_id, pattern = "[0][0-9][0-9][0-9]")# find the 4 number pattern with 0 in as first number = Id

TextArbeitszeit$id <- as.numeric(TextArbeitszeit$id)
#save(TextArbeitszeit, file = "TextArbeitszeit.rda") #only run once to save the data

#read the rdata files----

load(file = "E:/R Projects/Daten_MA/Masterarbeit/data/TextArbeitszeit.rda")

load(file = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitszeit_docs.rda")

load(file = "E:/R Projects/Daten_MA/Masterarbeit/data/Arbeitszeit_vocab.rda")

#create a corpus----
my_corpus <- corpus(TextArbeitszeit)

summary(my_corpus)

#tokenize it

my_corpus_token <- tokens(my_corpus, remove_punct = T, remove_symbols = T) %>% tokens_remove(sw)

#dfm

my_dfm <- dfm(my_corpus_token) 

my_dfm <- dfm_remove(my_dfm, min_nchar = 3) #take out stopwords

topfeatures(my_dfm, 50) 

my_dfm_trim <- dfm_trim(my_dfm, min_termfreq = 100)

#statistics with corpus meta data----

tokenInfo <- summary(object = my_corpus, n = 2000, showmeta = T) # save the summary in an object


token_Info2<- tokenInfo %>% group_by(date) %>% summarise(freq = n()) #group by year and count the texts per year
 

ggplot(data=token_Info2, aes(x = date, y = freq, group = 1)) + geom_line() + geom_point() +
  scale_x_continuous(labels = c(seq(1930, 1970, 5)), breaks = seq(1930, 1970, 5)) +
  theme_bw()


#wordcloud----

set.seed(100)
library("quanteda.textplots")
textplot_wordcloud(my_dfm, min_count = 20, random_order = FALSE, rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, "Dark2"))

#topic models-----

my_dfm_trim <- dfm_trim(my_dfm, min_termfreq = 5)

set.seed(100)
if (require("stm")) {
  my_lda_fit20 <- stm(my_dfm_trim, K = 10, verbose = FALSE)
  plot(my_lda_fit20)
}

#LDA after Welbers et al. (p. 257)-----

library(topicmodels)

my_dtm <- convert(my_dfm_trim, to = "topicmodels") #convert to topicmodels format

set.seed(100)
lda_topicmodel <- topicmodels::LDA(my_dtm, method = "VEM", k = 8 )
Topics_VEM_10 <- terms(lda_topicmodel, 20)

Topics_VEM_10[5, ]


#LDA Prototype after Rieger-----

#create an LDA package ready corpus 

yrs <- TextArbeitszeit$date
yrs <- lubridate::ymd(yrs, truncated = 2L) #R cannot make a date variable with only a year, so make a dummy year variable
#source https://stackoverflow.com/questions/30255833/convert-four-digit-year-values-to-class-date

TextArbeitszeit$date <- yrs

# make the tosca corpus

corpus_tosca <- textmeta(meta = as.meta(x = TextArbeitszeit, 
                                        cols = colnames(TextArbeitszeit), 
                                        idCol = "id",
                                      dateCol = "date", 
                                      titleCol = "doc_id"),
                         dateFormat = "%Y-%m-%d",
                       text = TextArbeitszeit$text)



#create clean corpus
tosca_corpus <- cleanTexts(object = corpus_tosca, sw = sw, ucp = T)
#somehow the cleanTexts() removes all meta, fill in the meta again
tosca_corpus$meta <- corpus_tosca$meta

save(tosca_corpus, file = "data/tosca_corpus.rda")
#make wordlist
wordlist <- makeWordlist(tosca_corpus$text)

Corpus_Prototype <- LDAprep(text = tosca_corpus$text, vocab = wordlist$words, reduce = T)


#save(Corpus_Prototype, file = "Arbeitszeit_docs.rda") only run this once to save the files
#save(wordlist, file = "Arbeitszeit_vocab.rda") 


#use the LDAPrototpye function
names(Corpus_Prototype) = paste0("id", seq_along(Corpus_Prototype)) #to name the lists, otherwise the code cannot run
save(Corpus_Prototype, file = "data/Corpus_Prototype.rda")
tic("LDA_Prototype")
LDA_Prototype <- LDAPrototype(docs = Corpus_Prototype, vocabLDA = wordlist$words,
                              n = 50, seeds = 1:50, id = "first_try", K = 9)
toc()

save(LDA_Prototype, file = "data/LDA_Prototype_Arbeitnehmer.rda")

#get the Prototype LDA
Prototype_LDA <- getLDA(LDA_Prototype)
#get the topics of the Prototype LDA
topics_Prototype <- getTopics(Prototype_LDA)
#see the n top words of the Prototype Topics
Topwords_Arbeitnehmer <- tosca::topWords(topics_Prototype, 10)

save(Topwords_Arbeitnehmer, file = "data/Topwords_Arbeitnehmer.rds")

clustRes <- clusterTopics(ldaresult = Prototype_LDA, xlab = "Topic", ylab = "Distance")


#topics over time 

tosca_corpus$meta$id <- paste("id", tosca_corpus$meta$id, sep = "")

plotTopic(object = tosca_corpus, ldaresult = Prototype_LDA, ldaID = names(Corpus_Prototype),
          rel = TRUE, curves = "smooth", smooth = 0.1, legend = "topleft", ylim = c(0, 0.5), unit = "year",
          select = c(1,2,3,4,5,6,8), tnames = c("Automation", "rechtliche Bestimmungen", "Frauen", "International",
                                                "Statistik", "SGB", "Mehr"))

plotArea(ldaresult = Prototype_LDA, ldaID = names(Corpus_Prototype), 
         meta =  tosca_corpus$meta, 
         unit = "year", sort = FALSE)

plotScot(tosca_corpus, curves = "both", unit = "year")
