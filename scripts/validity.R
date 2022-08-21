Arbeitgeber_csv <- Arbeitgeber_csv %>%  select(doc_id, complete_text,date)
corpus <- corpus(Arbeitgeber_csv,  text_field = "complete_text")
tokenized <- tokens(corpus)
kwic <- kwic(tokenized, pattern = "meister")
kwic

Streik <- read.csv("E:/R Projects/Daten_MA//Masterarbeit/data/Streik_1922_1971.csv")


## Validität

Lukas_Arbeitnehmer1 <- intruderWords(beta = Prototype_LDA$topics, numIntruder = 0:1, numTopwords = 10)

Lukas_Arbeitnehmer2 <- intruderWords(beta = Prototype_LDA$topics, numIntruder = 0:1, numTopwords = 10)

Lukas_Arbeitnehmer3 <- intruderWords(beta = Prototype_LDA$topics, numIntruder = 0:1, numTopwords = 10)


Lukas_Arbeitgeber1 <- intruderWords(beta = Prototype_LDA_Arbeitgeber$topics, numIntruder = 0:1, numTopwords = 10)

Lukas_Arbeitgeber2 <- intruderWords(beta = Prototype_LDA_Arbeitgeber$topics, numIntruder = 0:1, numTopwords = 10)

Lukas_Arbeitgeber3 <- intruderWords(beta = Prototype_LDA_Arbeitgeber$topics, numIntruder = 0:1, numTopwords = 10)
