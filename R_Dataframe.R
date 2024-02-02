#get working directory
getwd()

#load csv file
data <- read.csv("dataframe_data.csv")

#check loaded data
head(data)
tail(data)

#get column details
str(data)

#get loaded data summary
summary(data)

#convert column to factor
data$Year
temp <- factor(data$Year)
temp

#check unique values in this spcific column
levels(temp)

#filtering the year 1960
data1960 <- data[data$Year==1960,]
data1960


#filtering the year 2013
data2013 <- data[data$Year==2013,]
data2013

#check rows count
nrow(data1960)
nrow(data2013)

#create data frame
add1960 <- data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <-data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

summary(add1960)
summary(add2013)


#merge two data frame
merge1960 <- merge(data1960, add1960, by.x = "Country.Code", by.y = "Country")
merge2013 <- merge(data2013, add2013, by.x = "Country.Code", by.y = "Country")


head(merge1960)
head(data1960)
head(add1960)

str(merge1960)
str(merge2013)

#remove column
merge1960$Year <- NULL
merge2013$Year <- NULL

#import ggplot2 library
library(ggplot2)

#genrate plot by ggplot2 library
qplot(data = merge1960, x=Fertility.Rate, y=Life.Exp, colour=Region, size=I(5), main="Life Expentancy vs Fertility 1960", alpha=I(0.6))

qplot(data = merge2013, x=Fertility.Rate, y=Life.Exp, colour=Region, size=I(5), main="Life Expentancy vs Fertility 2013", alpha=I(0.6))

