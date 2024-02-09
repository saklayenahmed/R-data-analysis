#Check working directory and if want set setwd() for new working directory
getwd()

#load csv file for analysis
file <- "data/movie_data_02.csv"
mov <- read.csv(file)

#data exploration
head(mov)
summary(mov)
str(mov)


#activate ggplot2
#install.packages("ggplot2")
library(ggplot2)
