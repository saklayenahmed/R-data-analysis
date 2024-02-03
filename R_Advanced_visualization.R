file_name <- "movie_data.csv"

getwd()
setwd("__working__directory__")

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
q <- ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating, colour=Genre))

#add layers
q + geom_point()

#overriding aesthetic
q + geom_point(aes(size=CriticRatings))
q + geom_point(aes(colour=Budget))
q + geom_point(aes(x=Budget)) + 
  xlab("Budget")

#reduce line size
q + geom_line(size=0.1) + geom_point()
q + geom_line(size=0.1)


#---------- Mapping vs setting
r <- ggplot(data = movie, aes(x=CriticRatings,y=AudienceRating))
r + geom_point()


#add color
#mapping
r + geom_point(aes(colour=Genre))
r + geom_point(aes(size=Budget))

#setting
r + geom_point(colour="DarkGreen")
r + geom_point(size=3)

#setting ERROR:
r + geom_point(aes(colour="DarkGreen"))
r + geom_point(aes(size=3))


#------- Histograms and density charts
s <- ggplot(data = movie, aes(x=Budget))
s + geom_histogram(binwidth = 5)


#add color
s + geom_histogram(binwidth = 10, fill="Red")
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#add border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")


#density chart
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")

#layers
t <- ggplot(data=movie, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="white", colour="blue")

#another way layers
t = ggplot(data=movie)
t +geom_histogram(binwidth = 10, colour="blue", fill="white", aes(x=AudienceRating))
t +geom_histogram(binwidth = 10, colour="blue", fill="white", aes(x=CriticRatings))


#----------statistical transformation
u <- ggplot(data = movie, aes(x=CriticRatings, y = AudienceRating, colour=Genre))

u + geom_point() + geom_smooth(fill=NA)

#box plots
u <- ggplot(data = movie, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=.9) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)



#--------Facets
v <- ggplot(data = movie, aes(x=Budget))
v + geom_histogram(binwidth = 10, colour="black", aes(fill=Genre))

v + geom_histogram(binwidth = 10, colour="black", aes(fill=Genre)) +
  facet_grid(Genre~., scales = "free") + ylab("Genre Count")


# facets in scattered plot

w <- ggplot(data=movie, aes(x=CriticRatings, y=AudienceRating, colour=Genre))
w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=Budget)) +
  geom_smooth() +
  facet_grid(Genre~Year)


#---------Coordinates

m <- ggplot(data = movie, aes(x=CriticRatings, y=AudienceRating, size=Budget, colour=Genre))
m + geom_point()
m + geom_point() +
  xlim(50,100) + 
  ylim(50,100) 

# wont work while

n <- ggplot(data=movie, aes(x=Budget))
n+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")

n+ geom_histogram(binwidth = 10, aes(fill=Genre), colour="black") +
  ylim(0,100)

#zoom in
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black") +
  coord_cartesian(ylim=c(0,50))

#improve w vector
w + geom_point(aes(size=Budget)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))


#----------theme
o <- ggplot(data = movie, aes(x=Budget))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")
h

#axis label

h + xlab("Money") +
  ylab("Number of Movies")


#label Formatting
h + xlab("Money") +
  ylab("Number of Movies")+
  theme(axis.title.x = element_text(colour = "DarkGreen", size=30), axis.title.y = element_text(color = "Red", size=30))

#tick mark Formatting
h + xlab("Money") +
  ylab("Number of Movies")+
  theme(
    axis.title.x = element_text(colour = "DarkGreen", size=30), 
    axis.title.y = element_text(color = "Red", size=30), 
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20))


#legends Formatting
h + xlab("Money") +
  ylab("Number of Movies")+
  theme(
    axis.title.x = element_text(colour = "DarkGreen", size=30), 
    axis.title.y = element_text(color = "Red", size=30), 
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    legend.title = element_text(size=30),
    legend.text = element_text(size=20),
    legend.position = c(1,1),
    legend.justification = c(1,1))



#Title and theme of plot
h + xlab("Money") +
  ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(
    axis.title.x = element_text(colour = "DarkGreen", size=30), 
    axis.title.y = element_text(color = "Red", size=30), 
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    legend.title = element_text(size=30),
    legend.text = element_text(size=20),
    legend.position = c(1,1),
    legend.justification = c(1,1),
    plot.title = element_text(colour = "DarkGreen", size=30, family = "Courier"))
