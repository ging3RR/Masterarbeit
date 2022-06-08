
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