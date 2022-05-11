#packages
library(stringr)
library(dplyr)
library(quanteda)
library(readtext)

#pre-preparations----
#set working directory

setwd("E:/R Projects/Daten_MA/grs")


# create a list of all the files

Text1909_001_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1909_001",
                                 pattern = ".txt") #get all file names


path1909_001 <- "E:/R Projects/Daten_MA/grs/1909_001" # create an object with the path

Text1909_001_files <- str_c(path1909_001, Text1909_001_files, sep = "/") # string together the path and the file name

#import and pre cleaning----


Text1909_001 <- readtext(Text1909_001_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1909_001$text <- str_replace_all(Text1909_001$text, "[\n]", " ") # remove all new lines

Text1909_001$text <- str_remove_all(Text1909_001$text, pattern = "[\\d]") # remove all digits

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed(","), "") # remove all the kommas

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed("<"), "«") # change to sonderzeichen so it gets removed when tokenizing

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed(">"), "»") # change to sonderzeichen so it gets removed when tokenizing

Text1909_001$text <- str_replace_all(Text1909_001$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1909_001$text <- gsub(pattern = "\\¬\\s+", replacement = "", x = Text1909_001$text) # remove all the whitespaces, words separated by - can now be tokenized as one word


#view one object to check if the cleaning worked

Text1909_001$text[30]
Text1909_001$text[31]

#create a corpus
my_corpus <- corpus(Text1909_001)

summary(my_corpus)

#tokenize it

my_corpus_token <- tokens(my_corpus, remove_punct = T)

#analytics------

#dfm

my_dfm <- dfm(my_corpus_token)

my_dfm <- dfm_remove(my_dfm, stopwords("de"), min_nchar = 5) #take out stopwords
#if we take out all characters <3 Arbeitszeit is on place 49, when <4 place 48

topfeatures(my_dfm, 50) 

#kwic

kwic_Arbeitszeit <- kwic(my_corpus_token, pattern = "Arbeitszeit")
documents <- kwic_Arbeitszeit$docname #take all documents with the word Arbeitszeit
documents <- unique(documents)

kwic(my_corpus_token, pattern = "cts") #cts seems to be some kind of number


#wordcloud

set.seed(100)
library("quanteda.textplots")
textplot_wordcloud(my_dfm, min_count = 70, random_order = FALSE, rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, "Dark2"))

# topic models

my_dfm_trim <- dfm_trim(my_dfm, min_termfreq = 20)

set.seed(100)
if (require("stm")) {
  my_lda_fit20 <- stm(my_dfm_trim, K = 40, verbose = FALSE)
  plot(my_lda_fit20)
}

#only use Arbeitszeitartikel----


Text1909_001_Arbeitszeit_files <- str_c(path1909_001, documents, sep = "/")

Text1909_001_Arbeitszeit <- readtext(Text1909_001_Arbeitszeit_files, encoding = "UTF-8")


Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, "[\n]", " ") # remove all new lines

Text1909_001_Arbeitszeit$text <- str_remove_all(Text1909_001_Arbeitszeit$text, pattern = "[\\d]") # remove all digits

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed(","), "") # remove all the kommas

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed("<"), "«") # change to sonderzeichen so it gets removed when tokenizing

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed(">"), "»") # change to sonderzeichen so it gets removed when tokenizing

Text1909_001_Arbeitszeit$text <- str_replace_all(Text1909_001_Arbeitszeit$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1909_001_Arbeitszeit$text <- gsub(pattern = "\\¬\\s+", replacement = "", x = Text1909_001_Arbeitszeit$text) # remove all the whitespaces, words separated by - can now be tokenized as one word


#create a corpus
Arbeitszeit_1909_corpus <- corpus(Text1909_001_Arbeitszeit)

summary(Arbeitszeit_1909_corpus)

#tokenize it

Arbeitszeit_1909_corpus_token <- tokens(Arbeitszeit_1909_corpus, remove_punct = T)

#dfm

Arbeitszeit_1909_dfm <- dfm(Arbeitszeit_1909_corpus_token)

Arbeitszeit_1909_dfm <- dfm_remove(Arbeitszeit_1909_dfm, stopwords("de"), min_nchar = 5) #take out stopwords
#if we take out all characters <3 Arbeitszeit is on place 49, when <4 place 48

topfeatures(Arbeitszeit_1909_dfm, 50) 
# topic models

Arbeitszeit_1909_dfm_trim <- dfm_trim(Arbeitszeit_1909_dfm, min_termfreq = 5)

set.seed(100)
if (require("stm")) {
  my_lda_fit20 <- stm(Arbeitszeit_1909_dfm_trim, K = 20, verbose = FALSE)
  plot(my_lda_fit20)
}
