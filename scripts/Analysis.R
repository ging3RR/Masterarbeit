
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/Aussortieren.R")

#read in data----


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

TextArbeitszeit$text <- gsub(pattern = "\\¬ \\s+", replacement = "", x = TextArbeitszeit$text) # remove all the whitespaces, words separated by - can now be tokenized as one word


#create a corpus----
my_corpus <- corpus(TextArbeitszeit)

summary(my_corpus)

#tokenize it

my_corpus_token <- tokens(my_corpus, remove_punct = T)

#dfm

my_dfm <- dfm(my_corpus_token)

my_dfm <- dfm_remove(my_dfm, stopwords("de"), min_nchar = 4) #take out stopwords

topfeatures(my_dfm, 50) 

my_dfm_trim <- dfm_trim(my_dfm, min_termfreq = 100)

#wordcloud----

set.seed(100)
library("quanteda.textplots")
textplot_wordcloud(my_dfm, min_count = 20, random_order = FALSE, rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, "Dark2"))

# topic models-----

my_dfm_trim <- dfm_trim(my_dfm, min_termfreq = 100)

set.seed(100)
if (require("stm")) {
  my_lda_fit20 <- stm(my_dfm_trim, K = 20, verbose = FALSE)
  plot(my_lda_fit20)
}

#LDA after Welbers et al. (p. 257)-----

library(topicmodels)

my_dtm <- convert(my_dfm_trim, to = "topicmodels") #convert to topicmodels format

set.seed(100)
lda_topicmodel <- topicmodels::LDA(my_dtm, method = "VEM", k = 10 )
Topics_VEM_10 <- terms(lda_topicmodel, 20)

Topics_VEM_10[, 10]


#LDA Prototype after Rieger-----

#create an LDA package ready corpus 

#create the textmeta that is needed for the textmeta() function

TextArbeitszeit$date <- str_extract(string = TextArbeitszeit$doc_id, pattern = "[1][9][0-9][0-9]") # find the 4 number pattern with 1 in as first number = year

TextArbeitszeit$id <- str_extract(string = TextArbeitszeit$doc_id, pattern = "[0][0-9][0-9][0-9]")# find the 4 number pattern with 0 in as first number = Id

yrs <- TextArbeitszeit$date
yrs <- lubridate::ymd(yrs, truncated = 2L) #R cannot make a date variable with only a year, so make a dummy year variable
#source https://stackoverflow.com/questions/30255833/convert-four-digit-year-values-to-class-date

TextArbeitszeit$date <- yrs

TextArbeitszeit$names <- 1:length(TextArbeitszeit$doc_id)# create a names variable to prevent error:
#Error in LDARep Assertion on 'docs' failed: Must have names

# make the tosca corpus

corpus_tosca <- textmeta(meta = as.meta(x = TextArbeitszeit, cols = colnames(TextArbeitszeit), idCol = "id",
                                      dateCol = "date", titleCol = "doc_id"),
                       text = TextArbeitszeit$text)

tosca_corpus <- cleanTexts(corpus_tosca)

wordlist <- makeWordlist(tosca_corpus$text)

Corpus_Prototype <- LDAprep(text = tosca_corpus$text, vocab = wordlist$words, reduce = T)

names(Corpus_Prototype)s


#use the LDAPrototpye function

LDA_Prototype <- LDAPrototype(docs = Corpus_Prototype, vocabLDA = wordlist$words,vocabMerge = wordlist$words, n = 10, seeds = 1:5)


