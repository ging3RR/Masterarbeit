#packages
library(stringr)
library(dplyr)
library(quanteda)
library(readtext)
library(xml2)

library(XML)
#set working directory

setwd("E:/R Projects/Daten_MA/Arbeitgeber")

# create a list of all the files

Arbeitgeber1930_files <- list.files(path = "E:/R Projects/Daten_MA/Arbeitgeber/1930",
                                 pattern = ".xml") #get all file names


path1930 <- "E:/R Projects/Daten_MA/Arbeitgeber/1930"

Arbeitgeber1930_files <- str_c(path1930, Arbeitgeber1930, sep = "/")


Arbeitgeber1930_1 <- Arbeitgeber1930_files[1] #take only the first path


Arbeitgeber1930_01_text <- readtext(Arbeitgeber1930_1, text_field = ".//String") #try to import the XML



nodes <- xml_find_all(Arbeitgeber1930_1, ".//String")
