# First try to import txt files

#packages
library(stringr)
#set working directory

setwd("E:/R Projects/Daten_MA/grs")


# create a list of all the files

Text1909_001_files <- list.files(path = "E:/R Projects/Daten_MA/grs/1909_001",
                                 pattern = ".txt") #get all file names


path1909_001 <- "E:/R Projects/Daten_MA/grs/1909_001" # create an object with the path

Text1909_001_files <- str_c(path1909_001, Text1909_001_files, sep = "/") # string together the path and the file name

#now the files can be read with the lapply function

Text1909_001 <- lapply(Text1909_001_files, readtext) #read in all txt files



onetxt<- read.delim(file = "E:/R Projects/Daten_MA/grs/1909_001/grs-001_1909_001_0156.txt")

#try only to read the first word
words <- word(onetxt$X2378.3202,1)
#get class of the object
summary(words)

#paste all the parts into one object
words2 <- str_c(words[1],words[2])

lengthw <- length(words)
text <- "" #make an empty character vector that can be appended with the characters of the word object

for (i in 1:lengthw) {
  
  text <- str_c(text, words[i], sep = " ")
  
  
}

