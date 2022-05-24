#packages
source(file = "E:/R Projects/Daten_MA/Masterarbeit/scripts/packages.R")


# create a list of all the files

Arbeitgeber_files <- list.files(path = "E:/R Projects/Daten_MA/Arbeitgeber",
                                 pattern = ".xml", recursive = T) #get all file names

root <- "E:/R Projects/Daten_MA/Arbeitgeber"
head(Arbeitgeber_files)
tail(Arbeitgeber_files)
Arbeitgeber_files <- file.path(root, Arbeitgeber_files)

ns <- "http://www.loc.gov/standards/alto/ns-v2#"
xml_find_all(x = xml, xpath = "/xmlns:Layout", ns = xml_ns(xml))


parse_xml <- function(path){
  #file einlesen 
  xml <- read_xml(x = path)
  #Text extrahieren
  xml_find_all(x = xml, xpath = )
  #Rückgabe
  
}

for (path in Arbeitgeber_files){
  
  
  
}

















#mmm----
path1930 <- "E:/R Projects/Daten_MA/Arbeitgeber/1930"

Arbeitgeber1930_files <- str_c(path1930, Arbeitgeber1930_files, sep = "/")


Arbeitgeber1930_1 <- Arbeitgeber1930_files[1] #take only the first path

xml <- read_xml(x = "E:/R Projects/Daten_MA/Arbeitgeber/1930/BAU_1_000059110_1930_0001.xml")

xmlParse(file = xml_1)

data_xml = read_xml(x = Arbeitgeber1930_1)
data_xml <- as.list(data_xml)

ns <- "http://www.loc.gov/standards/alto/ns-v2#"
xml_find_all(x = xml, xpath = "/xmlns:Layout", ns = xml_ns(xml))

text_xml <- xml_text(xml)


Arbeitgeber1930_01_text <- readtext(Arbeitgeber1930_1, text_field = "") #try to import the XML




xpathSApply(doc = xml, path ="//*[@id=folder11]/div[2]/div[2]/span/span[6]", xmlValue)[1]




