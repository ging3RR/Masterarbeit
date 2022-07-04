#All the stopwords

sw<- c(tm::stopwords("german"), #standard stopwords
       "dass", #was not included in standard stopwords
       "max", # Max Weber is always cited in the beginning of the journal
       "weber",
       "robert",#Robert Bratschi as well
       "bratschi",
       "de", #word from Arbeitgeber Korpus probably from french
       tm::stopwords("french"), #remove all french stopwords
       "heft", #header information
       "monbijoustrasse",#header information
       "no", #number, header information
       "schweizerische", #header information
       "arbeitgeber-zeitung",#header information
       "indice", #französische Wörter
       "ouvriers",
       "syndicate",
       "occupés",
       "dans",
       "enterprises",
       "moyenne",
       "métaux",
       "ethorlogers",
       "industrie",
       "Employés",
       "Employées",
       "générale",
       "industrie",
       "semi",
       "qual.",
       "ungel.",
       "adultes",
       "Enquête",
       "commerce",
       "villes",
       "trimestre",
       "lindustrie",
       "travail",
       "suisse",
       "durée",
       "semaine",
       "nombre",
       "constructions",
       "salaires",
       "villes",
       "fr",
       "verlag",
       "dune",
       "marché",
       "heures",
       "mois",
       "salaire",
       "l'industrie",
       "logement",
       "complet",
       "chiffr",
       "valeur",
       "marché",
       "faillit"
       ) 
