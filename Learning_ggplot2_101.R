#ggplot2 101
install.packages("ggplot2", dependencies=TRUE)
install.packages("plyr") # splits data
install.packages("ggthemes") 
install.packages("reshape2") # melts data.frames #melt allows you to assign multiple variables to each name (for example, species names = sepal length, sepal width, petal length, and petal width) it assigns all of these variables in 1 column

#loading R packages into R
library("ggplot2")
library("plyr")
library("ggthemes")
library("reshape2")

#grammer of ggplot
  #data
  #aesthetics
  #geometry
  #facets
  #scales

#examples
head(iris)
iris[1:2, ]
df <- melt(iris, id.vars= "Species")
df[1:2, ]
dcast(df, Species ~ variable, mean)

#aesthetics example
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
summary(myplot)

#geometry example
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()
myplot + geom_point()

#colors species and make points bigger
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(size = 3)

#assign different shapes to species
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(aes(shape = Species), size = 3)


#diamond R dataset
  #generate a subset
d2 <- diamonds[sample(1:dim(diamonds) [1], 1000), ]
names(d2) #determine the names in the data.frame file

# plotting carat relative to price, color based on color
ggplot(data = d2, aes(x = carat, y = price, color = color)) + geom_point()


#another example
library(MASS) 

#example of boxplot
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()

myboxplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(myboxplot)

#facets examples
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() +
  facet_grid(Species ~ .) #faceting: single column, multiple rows

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() +
  facet_grid(. ~ Species) #faceting: multiple columns, single row

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
  geom_point() +
  facet_grid(~ Species) #facet wrapping; notice lack of .

#scales examples
aes(color = variable) #mapping
color = "black" #setting

scale_fill_manual(values = c("color1", "color2"))

library(RColorBrewer) #colors you can choose from
display.brewer.all()

#using a color brewer palette
df <- melt(iris, id.vars="Species")
ggplot(df, aes(Species, value, fill=variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")

#Adding a continuous scale to an axis
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) +
  geom_boxplot(width = .2) +
  scale_y_continuous(lables = (paste0(1:4, "Kg")), 
                     breaks = seq(1000, 4000, by = 1000))

#histogram example
h <- ggplot(faithful, aes(x=waiting))
h + geom_histogram(binwidth = 30, colour = "black")
h + geom_histogram(binwidth = 8, fill = "steelblue", colour = "black")

#bar plots examples
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat="identity") #problem with this graph, all values stacked together

df <- melt(iris, id.vars="Species")
ggplot(df, aes(Species, value, fill=variable)) +
  geom_bar(stat="identity")

ggplot(df, aes(Species, value, fill=variable)) +
  geom_bar(stat="identity", position = "dodge") #stacked values

ggplot(df, aes(Species, value, fill=variable)) +
  geom_bar(stat="identity", position = "dodge", colour = "black")

#Exercise 3 diamond dataset
names(d2)

ggplot(d2, aes(x=clarity, fill=cut)) + 
  geom_bar(position = "dodge")

#Density plots
ggplot(faithful, aes(waiting)) + 
  geom_density()

ggplot(faithful, aes(waiting)) + 
  geom_density(fill = "blue", alpha = 0.1) # alpha = transparency variable

#Adding smoothers



