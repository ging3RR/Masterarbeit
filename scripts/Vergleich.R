
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")
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

#create corpus objects

corpus_Arbeitgeber <- corpus(Arbeitgeber_csv, text_field = "complete_text")
corpus_Arbeitnehmer <- corpus(TextArbeitszeit)

corpus_combined <- corpus_Arbeitgeber + corpus_Arbeitnehmer

#make a dfm

#stopwords
sw<- c(tm::stopwords("german"), "dass")

corpus_dfm <- tokens(corpus_combined, remove_punct = T, 
                     remove_symbols = T,
                     remove_numbers = T) %>% 
  tokens_remove(sw) %>% tokens_group(groups = organisation) %>% 
  dfm()

#calculate keyness
result_keyness <- textstat_keyness(corpus_dfm, target = "Arbeitnehmer")

#plot
textplot_keyness(result_keyness)
toc()