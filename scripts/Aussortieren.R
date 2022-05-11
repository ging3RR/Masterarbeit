## This script will find all Txt's with the word Arbeitszeit in it
#packages

library(stringr)
library(dplyr)
library(quanteda)
library(readtext)
#set wd
setwd("E:/R Projects/Daten_MA/grs")


#1930----

Text1930_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1930_022",
                                 pattern = ".txt") #get all file names


path1930 <- "E:/R Projects/Daten_MA/grs/1930_022" # create an object with the path

Text1930_files <- str_c(path1930, Text1930_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1930 <- readtext(Text1930_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1930$text <- str_replace_all(Text1930$text, "[\n]", " ") # remove all new lines

Text1930$text <- str_remove_all(Text1930$text, pattern = "[\\d]") # remove all digits

Text1930$text <- str_replace_all(Text1930$text, fixed(","), "") # remove all the kommas

Text1930$text <- str_replace_all(Text1930$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1930$text <- str_replace_all(Text1930$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1930$text <- str_replace_all(Text1930$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1930$text <- str_replace_all(Text1930$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1930$text <- str_replace_all(Text1930$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1930$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1930$text) # remove all the whitespaces, words separated by - can now be tokenized as one word



#create a corpus
Corpus_1930 <- corpus(Text1930)


#tokenize it

Corpus_1930_token <- tokens(Corpus_1930, remove_punct = T)

#kwic
kwic_Arbeitszeit_1930 <- kwic(Corpus_1930_token, pattern = "Arbeitszeit")

Arbeitszeit_1930 <- kwic_Arbeitszeit_1930$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1930 <- unique(Arbeitszeit_1930)


#1931----

Text1931_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1931_023",
                             pattern = ".txt") #get all file names


path1931 <- "E:/R Projects/Daten_MA/grs/1931_023" # create an object with the path

Text1931_files <- str_c(path1931, Text1931_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1931 <- readtext(Text1931_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1931$text <- str_replace_all(Text1931$text, "[\n]", " ") # remove all new lines

Text1931$text <- str_remove_all(Text1931$text, pattern = "[\\d]") # remove all digits

Text1931$text <- str_replace_all(Text1931$text, fixed(","), "") # remove all the kommas

Text1931$text <- str_replace_all(Text1931$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1931$text <- str_replace_all(Text1931$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1931$text <- str_replace_all(Text1931$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1931$text <- str_replace_all(Text1931$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1931$text <- str_replace_all(Text1931$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1931$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1931$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1931 <- corpus(Text1931)

#tokenize it

Corpus_1931_token <- tokens(Corpus_1931, remove_punct = T)

#kwic
kwic_Arbeitszeit_1931 <- kwic(Corpus_1931_token, pattern = "Arbeitszeit")

Arbeitszeit_1931 <- kwic_Arbeitszeit_1931$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1931 <- unique(Arbeitszeit_1931)

#1932----

Text1932_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1932_024",
                             pattern = ".txt") #get all file names


path1932 <- "E:/R Projects/Daten_MA/grs/1932_024" # create an object with the path

Text1932_files <- str_c(path1932, Text1932_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1932 <- readtext(Text1932_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1932$text <- str_replace_all(Text1932$text, "[\n]", " ") # remove all new lines

Text1932$text <- str_remove_all(Text1932$text, pattern = "[\\d]") # remove all digits

Text1932$text <- str_replace_all(Text1932$text, fixed(","), "") # remove all the kommas

Text1932$text <- str_replace_all(Text1932$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1932$text <- str_replace_all(Text1932$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1932$text <- str_replace_all(Text1932$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1932$text <- str_replace_all(Text1932$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1932$text <- str_replace_all(Text1932$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1932$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1932$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1932 <- corpus(Text1932)

#tokenize it

Corpus_1932_token <- tokens(Corpus_1932, remove_punct = T)

#kwic
kwic_Arbeitszeit_1932 <- kwic(Corpus_1932_token, pattern = "Arbeitszeit")

Arbeitszeit_1932 <- kwic_Arbeitszeit_1932$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1932 <- unique(Arbeitszeit_1932)
#1933----

Text1933_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1933_025",
                             pattern = ".txt") #get all file names


path1933 <- "E:/R Projects/Daten_MA/grs/1933_025" # create an object with the path

Text1933_files <- str_c(path1933, Text1933_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1933 <- readtext(Text1933_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1933$text <- str_replace_all(Text1933$text, "[\n]", " ") # remove all new lines

Text1933$text <- str_remove_all(Text1933$text, pattern = "[\\d]") # remove all digits

Text1933$text <- str_replace_all(Text1933$text, fixed(","), "") # remove all the kommas

Text1933$text <- str_replace_all(Text1933$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1933$text <- str_replace_all(Text1933$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1933$text <- str_replace_all(Text1933$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1933$text <- str_replace_all(Text1933$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1933$text <- str_replace_all(Text1933$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1933$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1933$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1933 <- corpus(Text1933)

#tokenize it

Corpus_1933_token <- tokens(Corpus_1933, remove_punct = T)

#kwic
kwic_Arbeitszeit_1933 <- kwic(Corpus_1933_token, pattern = "Arbeitszeit")

Arbeitszeit_1933 <- kwic_Arbeitszeit_1933$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1933 <- unique(Arbeitszeit_1933)
#1934----

Text1934_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1934_026",
                             pattern = ".txt") #get all file names


path1934 <- "E:/R Projects/Daten_MA/grs/1934_026" # create an object with the path

Text1934_files <- str_c(path1934, Text1934_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1934 <- readtext(Text1934_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1934$text <- str_replace_all(Text1934$text, "[\n]", " ") # remove all new lines

Text1934$text <- str_remove_all(Text1934$text, pattern = "[\\d]") # remove all digits

Text1934$text <- str_replace_all(Text1934$text, fixed(","), "") # remove all the kommas

Text1934$text <- str_replace_all(Text1934$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1934$text <- str_replace_all(Text1934$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1934$text <- str_replace_all(Text1934$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1934$text <- str_replace_all(Text1934$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1934$text <- str_replace_all(Text1934$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1934$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1934$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1934 <- corpus(Text1934)

#tokenize it

Corpus_1934_token <- tokens(Corpus_1934, remove_punct = T)

#kwic
kwic_Arbeitszeit_1934 <- kwic(Corpus_1934_token, pattern = "Arbeitszeit")

Arbeitszeit_1934 <- kwic_Arbeitszeit_1934$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1934 <- unique(Arbeitszeit_1934)

#1935----

Text1935_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1935_027",
                             pattern = ".txt") #get all file names


path1935 <- "E:/R Projects/Daten_MA/grs/1935_027" # create an object with the path

Text1935_files <- str_c(path1935, Text1935_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1935 <- readtext(Text1935_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1935$text <- str_replace_all(Text1935$text, "[\n]", " ") # remove all new lines

Text1935$text <- str_remove_all(Text1935$text, pattern = "[\\d]") # remove all digits

Text1935$text <- str_replace_all(Text1935$text, fixed(","), "") # remove all the kommas

Text1935$text <- str_replace_all(Text1935$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1935$text <- str_replace_all(Text1935$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1935$text <- str_replace_all(Text1935$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1935$text <- str_replace_all(Text1935$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1935$text <- str_replace_all(Text1935$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1935$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1935$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1935 <- corpus(Text1935)

#tokenize it

Corpus_1935_token <- tokens(Corpus_1935, remove_punct = T)

#kwic
kwic_Arbeitszeit_1935 <- kwic(Corpus_1935_token, pattern = "Arbeitszeit")

Arbeitszeit_1935 <- kwic_Arbeitszeit_1935$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1935 <- unique(Arbeitszeit_1935)


#1936----

Text1936_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1936_028",
                             pattern = ".txt") #get all file names


path1936 <- "E:/R Projects/Daten_MA/grs/1936_028" # create an object with the path

Text1936_files <- str_c(path1936, Text1936_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1936 <- readtext(Text1936_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1936$text <- str_replace_all(Text1936$text, "[\n]", " ") # remove all new lines

Text1936$text <- str_remove_all(Text1936$text, pattern = "[\\d]") # remove all digits

Text1936$text <- str_replace_all(Text1936$text, fixed(","), "") # remove all the kommas

Text1936$text <- str_replace_all(Text1936$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1936$text <- str_replace_all(Text1936$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1936$text <- str_replace_all(Text1936$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1936$text <- str_replace_all(Text1936$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1936$text <- str_replace_all(Text1936$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1936$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1936$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1936 <- corpus(Text1936)

#tokenize it

Corpus_1936_token <- tokens(Corpus_1936, remove_punct = T)

#kwic
kwic_Arbeitszeit_1936 <- kwic(Corpus_1936_token, pattern = "Arbeitszeit")

Arbeitszeit_1936 <- kwic_Arbeitszeit_1936$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1936 <- unique(Arbeitszeit_1936)

#1937----

Text1937_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1937_029",
                             pattern = ".txt") #get all file names


path1937 <- "E:/R Projects/Daten_MA/grs/1937_029" # create an object with the path

Text1937_files <- str_c(path1937, Text1937_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1937 <- readtext(Text1937_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1937$text <- str_replace_all(Text1937$text, "[\n]", " ") # remove all new lines

Text1937$text <- str_remove_all(Text1937$text, pattern = "[\\d]") # remove all digits

Text1937$text <- str_replace_all(Text1937$text, fixed(","), "") # remove all the kommas

Text1937$text <- str_replace_all(Text1937$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1937$text <- str_replace_all(Text1937$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1937$text <- str_replace_all(Text1937$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1937$text <- str_replace_all(Text1937$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1937$text <- str_replace_all(Text1937$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1937$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1937$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1937 <- corpus(Text1937)

#tokenize it

Corpus_1937_token <- tokens(Corpus_1937, remove_punct = T)

#kwic
kwic_Arbeitszeit_1937 <- kwic(Corpus_1937_token, pattern = "Arbeitszeit")

Arbeitszeit_1937 <- kwic_Arbeitszeit_1937$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1937 <- unique(Arbeitszeit_1937)

#1938----

Text1938_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1938_030",
                             pattern = ".txt") #get all file names


path1938 <- "E:/R Projects/Daten_MA/grs/1938_030" # create an object with the path

Text1938_files <- str_c(path1938, Text1938_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1938 <- readtext(Text1938_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1938$text <- str_replace_all(Text1938$text, "[\n]", " ") # remove all new lines

Text1938$text <- str_remove_all(Text1938$text, pattern = "[\\d]") # remove all digits

Text1938$text <- str_replace_all(Text1938$text, fixed(","), "") # remove all the kommas

Text1938$text <- str_replace_all(Text1938$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1938$text <- str_replace_all(Text1938$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1938$text <- str_replace_all(Text1938$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1938$text <- str_replace_all(Text1938$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1938$text <- str_replace_all(Text1938$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1938$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1938$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1938 <- corpus(Text1938)

#tokenize it

Corpus_1938_token <- tokens(Corpus_1938, remove_punct = T)

#kwic
kwic_Arbeitszeit_1938 <- kwic(Corpus_1938_token, pattern = "Arbeitszeit")

Arbeitszeit_1938 <- kwic_Arbeitszeit_1938$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1938 <- unique(Arbeitszeit_1938)

#1939----

Text1939_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1939_031",
                             pattern = ".txt") #get all file names


path1939 <- "E:/R Projects/Daten_MA/grs/1939_031" # create an object with the path

Text1939_files <- str_c(path1939, Text1939_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1939 <- readtext(Text1939_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1939$text <- str_replace_all(Text1939$text, "[\n]", " ") # remove all new lines

Text1939$text <- str_remove_all(Text1939$text, pattern = "[\\d]") # remove all digits

Text1939$text <- str_replace_all(Text1939$text, fixed(","), "") # remove all the kommas

Text1939$text <- str_replace_all(Text1939$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1939$text <- str_replace_all(Text1939$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1939$text <- str_replace_all(Text1939$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1939$text <- str_replace_all(Text1939$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1939$text <- str_replace_all(Text1939$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1939$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1939$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1939 <- corpus(Text1939)

#tokenize it

Corpus_1939_token <- tokens(Corpus_1939, remove_punct = T)

#kwic
kwic_Arbeitszeit_1939 <- kwic(Corpus_1939_token, pattern = "Arbeitszeit")

Arbeitszeit_1939 <- kwic_Arbeitszeit_1939$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1939 <- unique(Arbeitszeit_1939)


#1940----

Text1940_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1940_032",
                             pattern = ".txt") #get all file names


path1940 <- "E:/R Projects/Daten_MA/grs/1940_032" # create an object with the path

Text1940_files <- str_c(path1940, Text1940_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1940 <- readtext(Text1940_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1940$text <- str_replace_all(Text1940$text, "[\n]", " ") # remove all new lines

Text1940$text <- str_remove_all(Text1940$text, pattern = "[\\d]") # remove all digits

Text1940$text <- str_replace_all(Text1940$text, fixed(","), "") # remove all the kommas

Text1940$text <- str_replace_all(Text1940$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1940$text <- str_replace_all(Text1940$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1940$text <- str_replace_all(Text1940$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1940$text <- str_replace_all(Text1940$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1940$text <- str_replace_all(Text1940$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1940$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1940$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1940 <- corpus(Text1940)

#tokenize it

Corpus_1940_token <- tokens(Corpus_1940, remove_punct = T)

#kwic
kwic_Arbeitszeit_1940 <- kwic(Corpus_1940_token, pattern = "Arbeitszeit")

Arbeitszeit_1940 <- kwic_Arbeitszeit_1940$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1940 <- unique(Arbeitszeit_1940)


#1941----

Text1941_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1941_033",
                             pattern = ".txt") #get all file names


path1941 <- "E:/R Projects/Daten_MA/grs/1941_033" # create an object with the path

Text1941_files <- str_c(path1941, Text1941_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1941 <- readtext(Text1941_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1941$text <- str_replace_all(Text1941$text, "[\n]", " ") # remove all new lines

Text1941$text <- str_remove_all(Text1941$text, pattern = "[\\d]") # remove all digits

Text1941$text <- str_replace_all(Text1941$text, fixed(","), "") # remove all the kommas

Text1941$text <- str_replace_all(Text1941$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1941$text <- str_replace_all(Text1941$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1941$text <- str_replace_all(Text1941$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1941$text <- str_replace_all(Text1941$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1941$text <- str_replace_all(Text1941$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1941$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1941$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1941 <- corpus(Text1941)

#tokenize it

Corpus_1941_token <- tokens(Corpus_1941, remove_punct = T)

#kwic
kwic_Arbeitszeit_1941 <- kwic(Corpus_1941_token, pattern = "Arbeitszeit")

Arbeitszeit_1941 <- kwic_Arbeitszeit_1941$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1941 <- unique(Arbeitszeit_1941)


#1942----

Text1942_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1942_034",
                             pattern = ".txt") #get all file names


path1942 <- "E:/R Projects/Daten_MA/grs/1942_034" # create an object with the path

Text1942_files <- str_c(path1942, Text1942_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1942 <- readtext(Text1942_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1942$text <- str_replace_all(Text1942$text, "[\n]", " ") # remove all new lines

Text1942$text <- str_remove_all(Text1942$text, pattern = "[\\d]") # remove all digits

Text1942$text <- str_replace_all(Text1942$text, fixed(","), "") # remove all the kommas

Text1942$text <- str_replace_all(Text1942$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1942$text <- str_replace_all(Text1942$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1942$text <- str_replace_all(Text1942$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1942$text <- str_replace_all(Text1942$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1942$text <- str_replace_all(Text1942$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1942$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1942$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1942 <- corpus(Text1942)

#tokenize it

Corpus_1942_token <- tokens(Corpus_1942, remove_punct = T)

#kwic
kwic_Arbeitszeit_1942 <- kwic(Corpus_1942_token, pattern = "Arbeitszeit")

Arbeitszeit_1942 <- kwic_Arbeitszeit_1942$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1942 <- unique(Arbeitszeit_1942)


#1943----

Text1943_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1943_035",
                             pattern = ".txt") #get all file names


path1943 <- "E:/R Projects/Daten_MA/grs/1943_035" # create an object with the path

Text1943_files <- str_c(path1943, Text1943_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1943 <- readtext(Text1943_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1943$text <- str_replace_all(Text1943$text, "[\n]", " ") # remove all new lines

Text1943$text <- str_remove_all(Text1943$text, pattern = "[\\d]") # remove all digits

Text1943$text <- str_replace_all(Text1943$text, fixed(","), "") # remove all the kommas

Text1943$text <- str_replace_all(Text1943$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1943$text <- str_replace_all(Text1943$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1943$text <- str_replace_all(Text1943$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1943$text <- str_replace_all(Text1943$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1943$text <- str_replace_all(Text1943$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1943$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1943$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1943 <- corpus(Text1943)

#tokenize it

Corpus_1943_token <- tokens(Corpus_1943, remove_punct = T)

#kwic
kwic_Arbeitszeit_1943 <- kwic(Corpus_1943_token, pattern = "Arbeitszeit")

Arbeitszeit_1943 <- kwic_Arbeitszeit_1943$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1943 <- unique(Arbeitszeit_1943)


#1944----

Text1944_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1944_036",
                             pattern = ".txt") #get all file names


path1944 <- "E:/R Projects/Daten_MA/grs/1944_036" # create an object with the path

Text1944_files <- str_c(path1944, Text1944_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1944 <- readtext(Text1944_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1944$text <- str_replace_all(Text1944$text, "[\n]", " ") # remove all new lines

Text1944$text <- str_remove_all(Text1944$text, pattern = "[\\d]") # remove all digits

Text1944$text <- str_replace_all(Text1944$text, fixed(","), "") # remove all the kommas

Text1944$text <- str_replace_all(Text1944$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1944$text <- str_replace_all(Text1944$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1944$text <- str_replace_all(Text1944$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1944$text <- str_replace_all(Text1944$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1944$text <- str_replace_all(Text1944$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1944$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1944$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1944 <- corpus(Text1944)

#tokenize it

Corpus_1944_token <- tokens(Corpus_1944, remove_punct = T)

#kwic
kwic_Arbeitszeit_1944 <- kwic(Corpus_1944_token, pattern = "Arbeitszeit")

Arbeitszeit_1944 <- kwic_Arbeitszeit_1944$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1944 <- unique(Arbeitszeit_1944)


#1945----

Text1945_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1945_037",
                             pattern = ".txt") #get all file names


path1945 <- "E:/R Projects/Daten_MA/grs/1945_037" # create an object with the path

Text1945_files <- str_c(path1945, Text1945_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1945 <- readtext(Text1945_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1945$text <- str_replace_all(Text1945$text, "[\n]", " ") # remove all new lines

Text1945$text <- str_remove_all(Text1945$text, pattern = "[\\d]") # remove all digits

Text1945$text <- str_replace_all(Text1945$text, fixed(","), "") # remove all the kommas

Text1945$text <- str_replace_all(Text1945$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1945$text <- str_replace_all(Text1945$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1945$text <- str_replace_all(Text1945$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1945$text <- str_replace_all(Text1945$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1945$text <- str_replace_all(Text1945$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1945$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1945$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1945 <- corpus(Text1945)

#tokenize it

Corpus_1945_token <- tokens(Corpus_1945, remove_punct = T)

#kwic
kwic_Arbeitszeit_1945 <- kwic(Corpus_1945_token, pattern = "Arbeitszeit")

Arbeitszeit_1945 <- kwic_Arbeitszeit_1945$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1945 <- unique(Arbeitszeit_1945)


#1946----

Text1946_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1946_038",
                             pattern = ".txt") #get all file names


path1946 <- "E:/R Projects/Daten_MA/grs/1946_038" # create an object with the path

Text1946_files <- str_c(path1946, Text1946_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1946 <- readtext(Text1946_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1946$text <- str_replace_all(Text1946$text, "[\n]", " ") # remove all new lines

Text1946$text <- str_remove_all(Text1946$text, pattern = "[\\d]") # remove all digits

Text1946$text <- str_replace_all(Text1946$text, fixed(","), "") # remove all the kommas

Text1946$text <- str_replace_all(Text1946$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1946$text <- str_replace_all(Text1946$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1946$text <- str_replace_all(Text1946$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1946$text <- str_replace_all(Text1946$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1946$text <- str_replace_all(Text1946$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1946$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1946$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1946 <- corpus(Text1946)

#tokenize it

Corpus_1946_token <- tokens(Corpus_1946, remove_punct = T)

#kwic
kwic_Arbeitszeit_1946 <- kwic(Corpus_1946_token, pattern = "Arbeitszeit")

Arbeitszeit_1946 <- kwic_Arbeitszeit_1946$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1946 <- unique(Arbeitszeit_1946)


#1947----

Text1947_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1947_039",
                             pattern = ".txt") #get all file names


path1947 <- "E:/R Projects/Daten_MA/grs/1947_039" # create an object with the path

Text1947_files <- str_c(path1947, Text1947_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1947 <- readtext(Text1947_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1947$text <- str_replace_all(Text1947$text, "[\n]", " ") # remove all new lines

Text1947$text <- str_remove_all(Text1947$text, pattern = "[\\d]") # remove all digits

Text1947$text <- str_replace_all(Text1947$text, fixed(","), "") # remove all the kommas

Text1947$text <- str_replace_all(Text1947$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1947$text <- str_replace_all(Text1947$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1947$text <- str_replace_all(Text1947$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1947$text <- str_replace_all(Text1947$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1947$text <- str_replace_all(Text1947$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1947$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1947$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1947 <- corpus(Text1947)

#tokenize it

Corpus_1947_token <- tokens(Corpus_1947, remove_punct = T)

#kwic
kwic_Arbeitszeit_1947 <- kwic(Corpus_1947_token, pattern = "Arbeitszeit")

Arbeitszeit_1947 <- kwic_Arbeitszeit_1947$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1947 <- unique(Arbeitszeit_1947)


#1948----

Text1948_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1948_040",
                             pattern = ".txt") #get all file names


path1948 <- "E:/R Projects/Daten_MA/grs/1948_040" # create an object with the path

Text1948_files <- str_c(path1948, Text1948_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1948 <- readtext(Text1948_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1948$text <- str_replace_all(Text1948$text, "[\n]", " ") # remove all new lines

Text1948$text <- str_remove_all(Text1948$text, pattern = "[\\d]") # remove all digits

Text1948$text <- str_replace_all(Text1948$text, fixed(","), "") # remove all the kommas

Text1948$text <- str_replace_all(Text1948$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1948$text <- str_replace_all(Text1948$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1948$text <- str_replace_all(Text1948$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1948$text <- str_replace_all(Text1948$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1948$text <- str_replace_all(Text1948$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1948$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1948$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1948 <- corpus(Text1948)

#tokenize it

Corpus_1948_token <- tokens(Corpus_1948, remove_punct = T)

#kwic
kwic_Arbeitszeit_1948 <- kwic(Corpus_1948_token, pattern = "Arbeitszeit")

Arbeitszeit_1948 <- kwic_Arbeitszeit_1948$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1948 <- unique(Arbeitszeit_1948)


#1949----

Text1949_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1949_041",
                             pattern = ".txt") #get all file names


path1949 <- "E:/R Projects/Daten_MA/grs/1949_041" # create an object with the path

Text1949_files <- str_c(path1949, Text1949_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1949 <- readtext(Text1949_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1949$text <- str_replace_all(Text1949$text, "[\n]", " ") # remove all new lines

Text1949$text <- str_remove_all(Text1949$text, pattern = "[\\d]") # remove all digits

Text1949$text <- str_replace_all(Text1949$text, fixed(","), "") # remove all the kommas

Text1949$text <- str_replace_all(Text1949$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1949$text <- str_replace_all(Text1949$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1949$text <- str_replace_all(Text1949$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1949$text <- str_replace_all(Text1949$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1949$text <- str_replace_all(Text1949$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1949$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1949$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1949 <- corpus(Text1949)

#tokenize it

Corpus_1949_token <- tokens(Corpus_1949, remove_punct = T)

#kwic
kwic_Arbeitszeit_1949 <- kwic(Corpus_1949_token, pattern = "Arbeitszeit")

Arbeitszeit_1949 <- kwic_Arbeitszeit_1949$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1949 <- unique(Arbeitszeit_1949)


#1950----

Text1950_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1950_042",
                             pattern = ".txt") #get all file names


path1950 <- "E:/R Projects/Daten_MA/grs/1950_042" # create an object with the path

Text1950_files <- str_c(path1950, Text1950_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1950 <- readtext(Text1950_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1950$text <- str_replace_all(Text1950$text, "[\n]", " ") # remove all new lines

Text1950$text <- str_remove_all(Text1950$text, pattern = "[\\d]") # remove all digits

Text1950$text <- str_replace_all(Text1950$text, fixed(","), "") # remove all the kommas

Text1950$text <- str_replace_all(Text1950$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1950$text <- str_replace_all(Text1950$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1950$text <- str_replace_all(Text1950$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1950$text <- str_replace_all(Text1950$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1950$text <- str_replace_all(Text1950$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1950$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1950$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1950 <- corpus(Text1950)

#tokenize it

Corpus_1950_token <- tokens(Corpus_1950, remove_punct = T)

#kwic
kwic_Arbeitszeit_1950 <- kwic(Corpus_1950_token, pattern = "Arbeitszeit")

Arbeitszeit_1950 <- kwic_Arbeitszeit_1950$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1950 <- unique(Arbeitszeit_1950)


#1951----

Text1951_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1951_043",
                             pattern = ".txt") #get all file names


path1951 <- "E:/R Projects/Daten_MA/grs/1951_043" # create an object with the path

Text1951_files <- str_c(path1951, Text1951_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1951 <- readtext(Text1951_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1951$text <- str_replace_all(Text1951$text, "[\n]", " ") # remove all new lines

Text1951$text <- str_remove_all(Text1951$text, pattern = "[\\d]") # remove all digits

Text1951$text <- str_replace_all(Text1951$text, fixed(","), "") # remove all the kommas

Text1951$text <- str_replace_all(Text1951$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1951$text <- str_replace_all(Text1951$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1951$text <- str_replace_all(Text1951$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1951$text <- str_replace_all(Text1951$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1951$text <- str_replace_all(Text1951$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1951$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1951$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1951 <- corpus(Text1951)

#tokenize it

Corpus_1951_token <- tokens(Corpus_1951, remove_punct = T)

#kwic
kwic_Arbeitszeit_1951 <- kwic(Corpus_1951_token, pattern = "Arbeitszeit")

Arbeitszeit_1951 <- kwic_Arbeitszeit_1951$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1951 <- unique(Arbeitszeit_1951)


#1952----

Text1952_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1952_044",
                             pattern = ".txt") #get all file names


path1952 <- "E:/R Projects/Daten_MA/grs/1952_044" # create an object with the path

Text1952_files <- str_c(path1952, Text1952_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1952 <- readtext(Text1952_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1952$text <- str_replace_all(Text1952$text, "[\n]", " ") # remove all new lines

Text1952$text <- str_remove_all(Text1952$text, pattern = "[\\d]") # remove all digits

Text1952$text <- str_replace_all(Text1952$text, fixed(","), "") # remove all the kommas

Text1952$text <- str_replace_all(Text1952$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1952$text <- str_replace_all(Text1952$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1952$text <- str_replace_all(Text1952$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1952$text <- str_replace_all(Text1952$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1952$text <- str_replace_all(Text1952$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1952$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1952$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1952 <- corpus(Text1952)

#tokenize it

Corpus_1952_token <- tokens(Corpus_1952, remove_punct = T)

#kwic
kwic_Arbeitszeit_1952 <- kwic(Corpus_1952_token, pattern = "Arbeitszeit")

Arbeitszeit_1952 <- kwic_Arbeitszeit_1952$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1952 <- unique(Arbeitszeit_1952)


#1953----

Text1953_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1953_045",
                             pattern = ".txt") #get all file names


path1953 <- "E:/R Projects/Daten_MA/grs/1953_045" # create an object with the path

Text1953_files <- str_c(path1953, Text1953_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1953 <- readtext(Text1953_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1953$text <- str_replace_all(Text1953$text, "[\n]", " ") # remove all new lines

Text1953$text <- str_remove_all(Text1953$text, pattern = "[\\d]") # remove all digits

Text1953$text <- str_replace_all(Text1953$text, fixed(","), "") # remove all the kommas

Text1953$text <- str_replace_all(Text1953$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1953$text <- str_replace_all(Text1953$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1953$text <- str_replace_all(Text1953$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1953$text <- str_replace_all(Text1953$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1953$text <- str_replace_all(Text1953$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1953$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1953$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1953 <- corpus(Text1953)

#tokenize it

Corpus_1953_token <- tokens(Corpus_1953, remove_punct = T)

#kwic
kwic_Arbeitszeit_1953 <- kwic(Corpus_1953_token, pattern = "Arbeitszeit")

Arbeitszeit_1953 <- kwic_Arbeitszeit_1953$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1953 <- unique(Arbeitszeit_1953)


#1954----

Text1954_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1954_046",
                             pattern = ".txt") #get all file names


path1954 <- "E:/R Projects/Daten_MA/grs/1954_046" # create an object with the path

Text1954_files <- str_c(path1954, Text1954_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1954 <- readtext(Text1954_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1954$text <- str_replace_all(Text1954$text, "[\n]", " ") # remove all new lines

Text1954$text <- str_remove_all(Text1954$text, pattern = "[\\d]") # remove all digits

Text1954$text <- str_replace_all(Text1954$text, fixed(","), "") # remove all the kommas

Text1954$text <- str_replace_all(Text1954$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1954$text <- str_replace_all(Text1954$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1954$text <- str_replace_all(Text1954$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1954$text <- str_replace_all(Text1954$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1954$text <- str_replace_all(Text1954$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1954$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1954$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1954 <- corpus(Text1954)

#tokenize it

Corpus_1954_token <- tokens(Corpus_1954, remove_punct = T)

#kwic
kwic_Arbeitszeit_1954 <- kwic(Corpus_1954_token, pattern = "Arbeitszeit")

Arbeitszeit_1954 <- kwic_Arbeitszeit_1954$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1954 <- unique(Arbeitszeit_1954)


#1955----

Text1955_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1955_047",
                             pattern = ".txt") #get all file names


path1955 <- "E:/R Projects/Daten_MA/grs/1955_047" # create an object with the path

Text1955_files <- str_c(path1955, Text1955_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1955 <- readtext(Text1955_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1955$text <- str_replace_all(Text1955$text, "[\n]", " ") # remove all new lines

Text1955$text <- str_remove_all(Text1955$text, pattern = "[\\d]") # remove all digits

Text1955$text <- str_replace_all(Text1955$text, fixed(","), "") # remove all the kommas

Text1955$text <- str_replace_all(Text1955$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1955$text <- str_replace_all(Text1955$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1955$text <- str_replace_all(Text1955$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1955$text <- str_replace_all(Text1955$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1955$text <- str_replace_all(Text1955$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1955$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1955$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1955 <- corpus(Text1955)

#tokenize it

Corpus_1955_token <- tokens(Corpus_1955, remove_punct = T)

#kwic
kwic_Arbeitszeit_1955 <- kwic(Corpus_1955_token, pattern = "Arbeitszeit")

Arbeitszeit_1955 <- kwic_Arbeitszeit_1955$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1955 <- unique(Arbeitszeit_1955)


#1956----

Text1956_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1956_048",
                             pattern = ".txt") #get all file names


path1956 <- "E:/R Projects/Daten_MA/grs/1956_048" # create an object with the path

Text1956_files <- str_c(path1956, Text1956_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1956 <- readtext(Text1956_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1956$text <- str_replace_all(Text1956$text, "[\n]", " ") # remove all new lines

Text1956$text <- str_remove_all(Text1956$text, pattern = "[\\d]") # remove all digits

Text1956$text <- str_replace_all(Text1956$text, fixed(","), "") # remove all the kommas

Text1956$text <- str_replace_all(Text1956$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1956$text <- str_replace_all(Text1956$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1956$text <- str_replace_all(Text1956$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1956$text <- str_replace_all(Text1956$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1956$text <- str_replace_all(Text1956$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1956$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1956$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1956 <- corpus(Text1956)

#tokenize it

Corpus_1956_token <- tokens(Corpus_1956, remove_punct = T)

#kwic
kwic_Arbeitszeit_1956 <- kwic(Corpus_1956_token, pattern = "Arbeitszeit")

Arbeitszeit_1956 <- kwic_Arbeitszeit_1956$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1956 <- unique(Arbeitszeit_1956)


#1957----

Text1957_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1957_049",
                             pattern = ".txt") #get all file names


path1957 <- "E:/R Projects/Daten_MA/grs/1957_049" # create an object with the path

Text1957_files <- str_c(path1957, Text1957_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1957 <- readtext(Text1957_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1957$text <- str_replace_all(Text1957$text, "[\n]", " ") # remove all new lines

Text1957$text <- str_remove_all(Text1957$text, pattern = "[\\d]") # remove all digits

Text1957$text <- str_replace_all(Text1957$text, fixed(","), "") # remove all the kommas

Text1957$text <- str_replace_all(Text1957$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1957$text <- str_replace_all(Text1957$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1957$text <- str_replace_all(Text1957$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1957$text <- str_replace_all(Text1957$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1957$text <- str_replace_all(Text1957$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1957$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1957$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1957 <- corpus(Text1957)

#tokenize it

Corpus_1957_token <- tokens(Corpus_1957, remove_punct = T)

#kwic
kwic_Arbeitszeit_1957 <- kwic(Corpus_1957_token, pattern = "Arbeitszeit")

Arbeitszeit_1957 <- kwic_Arbeitszeit_1957$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1957 <- unique(Arbeitszeit_1957)


#1958----

Text1958_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1958_050",
                             pattern = ".txt") #get all file names


path1958 <- "E:/R Projects/Daten_MA/grs/1958_050" # create an object with the path

Text1958_files <- str_c(path1958, Text1958_files, sep = "/") # string together the path and the file name



#import and pre cleaning


Text1958 <- readtext(Text1958_files, encoding = "UTF-8") #use UTF 8 encoding for Umlaute

Text1958$text <- str_replace_all(Text1958$text, "[\n]", " ") # remove all new lines

Text1958$text <- str_remove_all(Text1958$text, pattern = "[\\d]") # remove all digits

Text1958$text <- str_replace_all(Text1958$text, fixed(","), "") # remove all the kommas

Text1958$text <- str_replace_all(Text1958$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1958$text <- str_replace_all(Text1958$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1958$text <- str_replace_all(Text1958$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1958$text <- str_replace_all(Text1958$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1958$text <- str_replace_all(Text1958$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1958$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1958$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1958 <- corpus(Text1958)

#tokenize it

Corpus_1958_token <- tokens(Corpus_1958, remove_punct = T)

#kwic
kwic_Arbeitszeit_1958 <- kwic(Corpus_1958_token, pattern = "Arbeitszeit")

Arbeitszeit_1958 <- kwic_Arbeitszeit_1958$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1958 <- unique(Arbeitszeit_1958)


#1959----

Text1959_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1959_051",
                             pattern = ".txt") #get all file names


path1959 <- "E:/R Projects/Daten_MA/grs/1959_051" # create an object with the path

Text1959_files <- str_c(path1959, Text1959_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1959 <- readtext(Text1959_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1959$text <- str_replace_all(Text1959$text, "[\n]", " ") # remove all new lines

Text1959$text <- str_remove_all(Text1959$text, pattern = "[\\d]") # remove all digits

Text1959$text <- str_replace_all(Text1959$text, fixed(","), "") # remove all the kommas

Text1959$text <- str_replace_all(Text1959$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1959$text <- str_replace_all(Text1959$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1959$text <- str_replace_all(Text1959$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1959$text <- str_replace_all(Text1959$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1959$text <- str_replace_all(Text1959$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1959$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1959$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1959 <- corpus(Text1959)

#tokenize it

Corpus_1959_token <- tokens(Corpus_1959, remove_punct = T)

#kwic
kwic_Arbeitszeit_1959 <- kwic(Corpus_1959_token, pattern = "Arbeitszeit")

Arbeitszeit_1959 <- kwic_Arbeitszeit_1959$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1959 <- unique(Arbeitszeit_1959)


#1960----

Text1960_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1960_052",
                             pattern = ".txt") #get all file names


path1960 <- "E:/R Projects/Daten_MA/grs/1960_052" # create an object with the path

Text1960_files <- str_c(path1960, Text1960_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1960 <- readtext(Text1960_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1960$text <- str_replace_all(Text1960$text, "[\n]", " ") # remove all new lines

Text1960$text <- str_remove_all(Text1960$text, pattern = "[\\d]") # remove all digits

Text1960$text <- str_replace_all(Text1960$text, fixed(","), "") # remove all the kommas

Text1960$text <- str_replace_all(Text1960$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1960$text <- str_replace_all(Text1960$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1960$text <- str_replace_all(Text1960$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1960$text <- str_replace_all(Text1960$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1960$text <- str_replace_all(Text1960$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1960$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1960$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1960 <- corpus(Text1960)

#tokenize it

Corpus_1960_token <- tokens(Corpus_1960, remove_punct = T)

#kwic
kwic_Arbeitszeit_1960 <- kwic(Corpus_1960_token, pattern = "Arbeitszeit")

Arbeitszeit_1960 <- kwic_Arbeitszeit_1960$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1960 <- unique(Arbeitszeit_1960)


#1961----

Text1961_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1961_053",
                             pattern = ".txt") #get all file names


path1961 <- "E:/R Projects/Daten_MA/grs/1961_053" # create an object with the path

Text1961_files <- str_c(path1961, Text1961_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1961 <- readtext(Text1961_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1961$text <- str_replace_all(Text1961$text, "[\n]", " ") # remove all new lines

Text1961$text <- str_remove_all(Text1961$text, pattern = "[\\d]") # remove all digits

Text1961$text <- str_replace_all(Text1961$text, fixed(","), "") # remove all the kommas

Text1961$text <- str_replace_all(Text1961$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1961$text <- str_replace_all(Text1961$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1961$text <- str_replace_all(Text1961$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1961$text <- str_replace_all(Text1961$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1961$text <- str_replace_all(Text1961$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1961$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1961$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1961 <- corpus(Text1961)

#tokenize it

Corpus_1961_token <- tokens(Corpus_1961, remove_punct = T)

#kwic
kwic_Arbeitszeit_1961 <- kwic(Corpus_1961_token, pattern = "Arbeitszeit")

Arbeitszeit_1961 <- kwic_Arbeitszeit_1961$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1961 <- unique(Arbeitszeit_1961)


#1962----

Text1962_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1962_054",
                             pattern = ".txt") #get all file names


path1962 <- "E:/R Projects/Daten_MA/grs/1962_054" # create an object with the path

Text1962_files <- str_c(path1962, Text1962_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1962 <- readtext(Text1962_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1962$text <- str_replace_all(Text1962$text, "[\n]", " ") # remove all new lines

Text1962$text <- str_remove_all(Text1962$text, pattern = "[\\d]") # remove all digits

Text1962$text <- str_replace_all(Text1962$text, fixed(","), "") # remove all the kommas

Text1962$text <- str_replace_all(Text1962$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1962$text <- str_replace_all(Text1962$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1962$text <- str_replace_all(Text1962$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1962$text <- str_replace_all(Text1962$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1962$text <- str_replace_all(Text1962$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1962$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1962$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1962 <- corpus(Text1962)

#tokenize it

Corpus_1962_token <- tokens(Corpus_1962, remove_punct = T)

#kwic
kwic_Arbeitszeit_1962 <- kwic(Corpus_1962_token, pattern = "Arbeitszeit")

Arbeitszeit_1962 <- kwic_Arbeitszeit_1962$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1962 <- unique(Arbeitszeit_1962)


#1963----

Text1963_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1963_055",
                             pattern = ".txt") #get all file names


path1963 <- "E:/R Projects/Daten_MA/grs/1963_055" # create an object with the path

Text1963_files <- str_c(path1963, Text1963_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1963 <- readtext(Text1963_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1963$text <- str_replace_all(Text1963$text, "[\n]", " ") # remove all new lines

Text1963$text <- str_remove_all(Text1963$text, pattern = "[\\d]") # remove all digits

Text1963$text <- str_replace_all(Text1963$text, fixed(","), "") # remove all the kommas

Text1963$text <- str_replace_all(Text1963$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1963$text <- str_replace_all(Text1963$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1963$text <- str_replace_all(Text1963$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1963$text <- str_replace_all(Text1963$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1963$text <- str_replace_all(Text1963$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1963$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1963$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1963 <- corpus(Text1963)

#tokenize it

Corpus_1963_token <- tokens(Corpus_1963, remove_punct = T)

#kwic
kwic_Arbeitszeit_1963 <- kwic(Corpus_1963_token, pattern = "Arbeitszeit")

Arbeitszeit_1963 <- kwic_Arbeitszeit_1963$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1963 <- unique(Arbeitszeit_1963)


#1964----

Text1964_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1964_056",
                             pattern = ".txt") #get all file names


path1964 <- "E:/R Projects/Daten_MA/grs/1964_056" # create an object with the path

Text1964_files <- str_c(path1964, Text1964_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1964 <- readtext(Text1964_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1964$text <- str_replace_all(Text1964$text, "[\n]", " ") # remove all new lines

Text1964$text <- str_remove_all(Text1964$text, pattern = "[\\d]") # remove all digits

Text1964$text <- str_replace_all(Text1964$text, fixed(","), "") # remove all the kommas

Text1964$text <- str_replace_all(Text1964$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1964$text <- str_replace_all(Text1964$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1964$text <- str_replace_all(Text1964$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1964$text <- str_replace_all(Text1964$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1964$text <- str_replace_all(Text1964$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1964$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1964$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1964 <- corpus(Text1964)

#tokenize it

Corpus_1964_token <- tokens(Corpus_1964, remove_punct = T)

#kwic
kwic_Arbeitszeit_1964 <- kwic(Corpus_1964_token, pattern = "Arbeitszeit")

Arbeitszeit_1964 <- kwic_Arbeitszeit_1964$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1964 <- unique(Arbeitszeit_1964)


#1965----

Text1965_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1965_057",
                             pattern = ".txt") #get all file names


path1965 <- "E:/R Projects/Daten_MA/grs/1965_057" # create an object with the path

Text1965_files <- str_c(path1965, Text1965_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1965 <- readtext(Text1965_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1965$text <- str_replace_all(Text1965$text, "[\n]", " ") # remove all new lines

Text1965$text <- str_remove_all(Text1965$text, pattern = "[\\d]") # remove all digits

Text1965$text <- str_replace_all(Text1965$text, fixed(","), "") # remove all the kommas

Text1965$text <- str_replace_all(Text1965$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1965$text <- str_replace_all(Text1965$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1965$text <- str_replace_all(Text1965$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1965$text <- str_replace_all(Text1965$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1965$text <- str_replace_all(Text1965$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1965$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1965$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1965 <- corpus(Text1965)

#tokenize it

Corpus_1965_token <- tokens(Corpus_1965, remove_punct = T)

#kwic
kwic_Arbeitszeit_1965 <- kwic(Corpus_1965_token, pattern = "Arbeitszeit")

Arbeitszeit_1965 <- kwic_Arbeitszeit_1965$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1965 <- unique(Arbeitszeit_1965)


#1966----

Text1966_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1966_058",
                             pattern = ".txt") #get all file names


path1966 <- "E:/R Projects/Daten_MA/grs/1966_058" # create an object with the path

Text1966_files <- str_c(path1966, Text1966_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1966 <- readtext(Text1966_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1966$text <- str_replace_all(Text1966$text, "[\n]", " ") # remove all new lines

Text1966$text <- str_remove_all(Text1966$text, pattern = "[\\d]") # remove all digits

Text1966$text <- str_replace_all(Text1966$text, fixed(","), "") # remove all the kommas

Text1966$text <- str_replace_all(Text1966$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1966$text <- str_replace_all(Text1966$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1966$text <- str_replace_all(Text1966$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1966$text <- str_replace_all(Text1966$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1966$text <- str_replace_all(Text1966$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1966$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1966$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1966 <- corpus(Text1966)

#tokenize it

Corpus_1966_token <- tokens(Corpus_1966, remove_punct = T)

#kwic
kwic_Arbeitszeit_1966 <- kwic(Corpus_1966_token, pattern = "Arbeitszeit")

Arbeitszeit_1966 <- kwic_Arbeitszeit_1966$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1966 <- unique(Arbeitszeit_1966)


#1967----

Text1967_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1967_059",
                             pattern = ".txt") #get all file names


path1967 <- "E:/R Projects/Daten_MA/grs/1967_059" # create an object with the path

Text1967_files <- str_c(path1967, Text1967_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1967 <- readtext(Text1967_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1967$text <- str_replace_all(Text1967$text, "[\n]", " ") # remove all new lines

Text1967$text <- str_remove_all(Text1967$text, pattern = "[\\d]") # remove all digits

Text1967$text <- str_replace_all(Text1967$text, fixed(","), "") # remove all the kommas

Text1967$text <- str_replace_all(Text1967$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1967$text <- str_replace_all(Text1967$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1967$text <- str_replace_all(Text1967$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1967$text <- str_replace_all(Text1967$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1967$text <- str_replace_all(Text1967$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1967$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1967$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1967 <- corpus(Text1967)

#tokenize it

Corpus_1967_token <- tokens(Corpus_1967, remove_punct = T)

#kwic
kwic_Arbeitszeit_1967 <- kwic(Corpus_1967_token, pattern = "Arbeitszeit")

Arbeitszeit_1967 <- kwic_Arbeitszeit_1967$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1967 <- unique(Arbeitszeit_1967)


#1968----

Text1968_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1968_060",
                             pattern = ".txt") #get all file names


path1968 <- "E:/R Projects/Daten_MA/grs/1968_060" # create an object with the path

Text1968_files <- str_c(path1968, Text1968_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1968 <- readtext(Text1968_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1968$text <- str_replace_all(Text1968$text, "[\n]", " ") # remove all new lines

Text1968$text <- str_remove_all(Text1968$text, pattern = "[\\d]") # remove all digits

Text1968$text <- str_replace_all(Text1968$text, fixed(","), "") # remove all the kommas

Text1968$text <- str_replace_all(Text1968$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1968$text <- str_replace_all(Text1968$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1968$text <- str_replace_all(Text1968$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1968$text <- str_replace_all(Text1968$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1968$text <- str_replace_all(Text1968$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1968$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1968$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1968 <- corpus(Text1968)

#tokenize it

Corpus_1968_token <- tokens(Corpus_1968, remove_punct = T)

#kwic
kwic_Arbeitszeit_1968 <- kwic(Corpus_1968_token, pattern = "Arbeitszeit")

Arbeitszeit_1968 <- kwic_Arbeitszeit_1968$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1968 <- unique(Arbeitszeit_1968)


#1969----

Text1969_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1969_061",
                             pattern = ".txt") #get all file names


path1969 <- "E:/R Projects/Daten_MA/grs/1969_061" # create an object with the path

Text1969_files <- str_c(path1969, Text1969_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1969 <- readtext(Text1969_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1969$text <- str_replace_all(Text1969$text, "[\n]", " ") # remove all new lines

Text1969$text <- str_remove_all(Text1969$text, pattern = "[\\d]") # remove all digits

Text1969$text <- str_replace_all(Text1969$text, fixed(","), "") # remove all the kommas

Text1969$text <- str_replace_all(Text1969$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1969$text <- str_replace_all(Text1969$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1969$text <- str_replace_all(Text1969$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1969$text <- str_replace_all(Text1969$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1969$text <- str_replace_all(Text1969$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1969$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1969$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1969 <- corpus(Text1969)

#tokenize it

Corpus_1969_token <- tokens(Corpus_1969, remove_punct = T)

#kwic
kwic_Arbeitszeit_1969 <- kwic(Corpus_1969_token, pattern = "Arbeitszeit")

Arbeitszeit_1969 <- kwic_Arbeitszeit_1969$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1969 <- unique(Arbeitszeit_1969)


#1970----

Text1970_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1970_062",
                             pattern = ".txt") #get all file names


path1970 <- "E:/R Projects/Daten_MA/grs/1970_062" # create an object with the path

Text1970_files <- str_c(path1970, Text1970_files, sep = "/") # string together the path and the file name


#import and pre cleaning


Text1970 <- readtext(Text1970_files, encoding = "UTF-8") #use UFT 8 encoding for Umlaute

Text1970$text <- str_replace_all(Text1970$text, "[\n]", " ") # remove all new lines

Text1970$text <- str_remove_all(Text1970$text, pattern = "[\\d]") # remove all digits

Text1970$text <- str_replace_all(Text1970$text, fixed(","), "") # remove all the kommas

Text1970$text <- str_replace_all(Text1970$text, fixed("<EOS>"), "") # remove all End of Sentence

Text1970$text <- str_replace_all(Text1970$text, fixed("<EOP>"), "") #remove all end of paragraph

Text1970$text <- str_replace_all(Text1970$text, fixed("<"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1970$text <- str_replace_all(Text1970$text, fixed(">"), "?") # change to sonderzeichen so it gets removed when tokenizing

Text1970$text <- str_replace_all(Text1970$text, fixed("GEWERKSCHAFTLICHE  RUNDSCHAU"), "") # remove kopfzeile

Text1970$text <- gsub(pattern = "\\?\\s+", replacement = "", x = Text1970$text) # remove all the whitespaces, words separated by - can now be tokenized as one word

#create a corpus
Corpus_1970 <- corpus(Text1970)

#tokenize it

Corpus_1970_token <- tokens(Corpus_1970, remove_punct = T)

#kwic
kwic_Arbeitszeit_1970 <- kwic(Corpus_1970_token, pattern = "Arbeitszeit")

Arbeitszeit_1970 <- kwic_Arbeitszeit_1970$docname #take all documents with the word Arbeitszeit
Arbeitszeit_1970 <- unique(Arbeitszeit_1970)




#append all lists ----


Arbeitszeit <- c(Arbeitszeit_1930, 
                 Arbeitszeit_1931,
                 Arbeitszeit_1932,
                 Arbeitszeit_1933,
                 Arbeitszeit_1934,
                 Arbeitszeit_1935,
                 Arbeitszeit_1936,
                 Arbeitszeit_1937,
                 Arbeitszeit_1938,
                 Arbeitszeit_1939,
                 Arbeitszeit_1940,
                 Arbeitszeit_1941,
                 Arbeitszeit_1942,
                 Arbeitszeit_1943,
                 Arbeitszeit_1944,
                 Arbeitszeit_1945,
                 Arbeitszeit_1946,
                 Arbeitszeit_1947,
                 Arbeitszeit_1948,
                 Arbeitszeit_1949,
                 Arbeitszeit_1950,
                 Arbeitszeit_1951,
                 Arbeitszeit_1952,
                 Arbeitszeit_1953,
                 Arbeitszeit_1954,
                 Arbeitszeit_1955,
                 Arbeitszeit_1956,
                 Arbeitszeit_1957,
                 Arbeitszeit_1958,
                 Arbeitszeit_1959,
                 Arbeitszeit_1960,
                 Arbeitszeit_1961,
                 Arbeitszeit_1962,
                 Arbeitszeit_1963,
                 Arbeitszeit_1964,
                 Arbeitszeit_1965,
                 Arbeitszeit_1966,
                 Arbeitszeit_1967,
                 Arbeitszeit_1968,
                 Arbeitszeit_1969,
                 Arbeitszeit_1970)




#remove all objects but one----

rm(list = setdiff(ls(), "Arbeitszeit"))