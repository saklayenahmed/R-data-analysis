#load data by file choose option
#stats <- read.csv(file.choose())
#stats

#work directory
getwd()
setwd("D:\\Software\\Code\\R\\R-data-analysis")


#remove data
rm(stats)

#load csv file
stats <- read.csv("dataframe_data.csv")
stats


#check col and row
nrow(stats)
ncol(stats)


#get top and bototm rows
head(stats)
tail(stats)

#get uniform ramdom divates
runif(stats)


#get data details
str(stats)
summary(stats)

#get specifi cell value
stats[3,3]
stats[3, "Birth.rate"]

stats$Internet.users[2]
class(stats)

#get factor unique value of col
levels(stats$Income.Group)


#subsetting
stats[c(3,10),]
stats[,1,drop=F]
stats$Birth.rate * stats$Internet.users
stats$myCalc <- stats$Birth.rate * stats$Internet.users

head(stats)
stats$fac <- NULL


#filter by specific value
filter <- stats$Internet.users < 2
stats[filter,]
stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40  & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
stats[stats$Country.Name=="Bangladesh",]


#install.packages("ggplot2")
library(ggplot2)

?qplot

#create qplot by ggplot library
qplot(data=stats, x=Internet.users)
qplot(data = stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue"))
qplot(data = stats, x=Income.Group, y=Birth.rate, geom = "boxplot")
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group)


#make dataframe form vector data
mydf<- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)

colnames(mydf) <- c("Country", "Code", "Region")
rm(mydf)
mydf<- data.frame(country=Countries_2012_Dataset, code=Codes_2012_Dataset, region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#merge two dataframe
mergerd <- merge(stats, mydf, by.x="Country.Code", by.y = "code")
head(mergerd)
mergerd$country <- NULL
str(mergerd)


#qplot by ggplot library
qplot(data = mergerd, x=Internet.users, y=Birth.rate)
qplot(data = mergerd, x=Internet.users, y=Birth.rate, colour=region)
qplot(data = mergerd, x=Internet.users, y=Birth.rate, colour=region, size=I(5), shape=I(19))
qplot(data = mergerd, x=Internet.users, y=Birth.rate, colour=region, size=I(5), shape=I(19), alpha=I(0.3))
qplot(data = mergerd, x=Internet.users, y=Birth.rate, colour=region, size=I(5), shape=I(19), alpha=I(0.3), main="Birth Rate vs Internet Users")


#covert column to factor
mergerd <- as.factor(mergerd$Income.Group)
levels(mergerd)

#convert factor to dataframe
mergerd <- data.frame(mergerd)
