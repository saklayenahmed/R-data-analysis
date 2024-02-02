install.packages("ggplot2")
?ggplot()

library(ggplot2)

diamonds <- read.csv("diamonds_data.csv")

qplot(data = diamonds,carat, price, colour=clarity, facets = .~clarity)
