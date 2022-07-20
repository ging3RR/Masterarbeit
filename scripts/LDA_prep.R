# Arbeitnehmer----

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


#make wordlist
wordlist <- makeWordlist(tosca_corpus$text)

Corpus_Prototype <- LDAprep(text = tosca_corpus$text, vocab = wordlist$words, reduce = T)


# Arbeitgeber----
#create an LDA package ready corpus
Arbeitgeber_csv_LDA <- Arbeitgeber_csv %>% select(text, date, doc_id.1, complete_text)

yrs <- Arbeitgeber_csv_LDA$date
yrs <- lubridate::ymd(yrs, truncated = 2L) #R cannot make a date variable with only a year, so make a dummy year variable
#source https://stackoverflow.com/questions/30255833/convert-four-digit-year-values-to-class-date

Arbeitgeber_csv_LDA$date <- yrs

# make the tosca corpus



corpus_tosca_Arbeitgeber <- textmeta(meta = as.meta(x = Arbeitgeber_csv_LDA, 
                                                    cols = colnames(Arbeitgeber_csv_LDA), 
                                                    idCol = "text",
                                                    dateCol = "date", 
                                                    titleCol = "doc_id.1"),
                                     dateFormat = "%Y-%m-%d",
                                     text = Arbeitgeber_csv_LDA$complete_text)



#create clean corpus
tosca_corpus_Arbeitgeber <- cleanTexts(object = corpus_tosca_Arbeitgeber, sw = sw, ucp = T)
#somehow the cleanTexts() removes all meta, fill in the meta again
tosca_corpus_Arbeitgeber$meta <- corpus_tosca_Arbeitgeber$meta



#make wordlist
wordlist_Arbeitgeber <- makeWordlist(tosca_corpus_Arbeitgeber$text)

Corpus_Prototype_Arbeitgeber <- LDAprep(text = tosca_corpus_Arbeitgeber$text, vocab = wordlist_Arbeitgeber$words, reduce = T)
