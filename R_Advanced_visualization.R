file_name <- "P2-Movie-Ratings.csv"

getwd()
setwd("D:\\Software\\Code\\R\\Udemy")

#data
movie <- read.csv(file_name)
head(movie)
colnames(movie) <- c("Film","Genre","CriticRatings","AudienceRating","Budget","Year")
str(movie)

#convert vector to a factor 
movie$Film <- factor(movie$Film)
movie$Genre <- factor(movie$Genre)
movie$Year<- factor(movie$Year)
summary(movie)

#aesthetic 
library(ggplot2)

ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating))

#geometry
ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating)) +geom_point()


#add color
ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating, colour=Genre)) +geom_point()

#add size
ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating, colour=Genre, size=Budget)) +geom_point()

#---------Ploting with layers

#object plot
p <- ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating, colour=Genre, size=Budget))

#point
p + geom_point()

#line
p+geom_line()

#multiple layers
p+geom_point() + geom_line()

#------------overriding aesthetic
q <- ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating, colour=Genre, size=Budget))

#add layers
q + geom_point()

#overriding aesthetic
q + geom_point(aes(size=CriticRatings))
q + geom_point(aes(colour=Budget))


