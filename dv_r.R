library(ggplot2)

plot(iris$Petal.Length, iris$Petal.Width,
     pch=c(21,22,23)[iris$Species],
     bg=c("red", "green", "blue")[iris$Species])

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point(aes(color=Species, shape=Species))

#################
# Line graph
library(dplyr)
library(ggplot2)

class(AirPassengers)
plot(AirPassengers, col = "blue",
     xlab = "Date",
     ylab = "Passengers",
     main = "Air Passenger Numbers 1949-1960")


dfpassengers <- data.frame(
  y=as.vector(AirPassengers)
)
dfpassengers["x"] <- 1:now(dfpassengers)

head(dfpassengers)
ggplot(dfpassengers, aes(x=x, y=y)) +
  geom_line() +
  labs(x = "Month",
       y = "Passengers",
       title = "Air Passenger Numbers 1949-1960")

#####################
# Barplot

head(mtcars)

vs_cyl_count <- table(mtcars$vs, mtcars$cyl)
vs_cyl_count
barplot(vs_cyl_count,
        main = "V or S engine by Sylinders",
        xlab="Cylinders", col=c("red", "green"),
        legend = c("V", "S"))

df_count <- data.frame(
  cyl=as.factor(rep(colnames(vs_cyl_count), 2)),
  cyl_count=c(vs_cyl_count[1,], vs_cyl_count[2,]),
  vs=as.factor(rep(0:1,each=3))
)

df_count

ggplot(df_count, aes(x=cyl, y=cyl_count, fill=vs)) +
  geom_bar(stat = "identity") +
  labs(x = "Cylinders",
       y = "Count",
       title = "V or S enginer by Cylinders")
###########
# Boxplots

library(ggplot2)

boxplot(mpg ~ cyl, mtcars,
        main="Car Milage by Cylinder",
        xlab="Cylinders",
        ylab="Gas Milage")

ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) +
  geom_boxplot()
######################
# Histograms

help("faithful")

hist(faithful$eruptions,
     main = "Eruption Frequencies",
     xlab = "Duration",
     ylim = c(0,80))

ggplot(faithful, aes(x=eruptions)) +
  geom_histogram(
    breaks=seq(1.5,
               5.5, by = 0.5),
    col = "black",
    fill="white"
  ) +
  xlim(c(1.5, 5.5)) +
  labs(x = "Duration",
       y = "Frequency",
       title = "Eruption Duration Frequencies")
  
# try by = 0.25
############################
# Bubble plot

library(ggplot2)

mtcars$cyl <- as.factor(mtcars$cyl)

ggplot(mtcars, aes(x=mpg, y=wt)) +
  geom_point(aes(size=hp,
                 colour=cyl,
                 fill=cyl,
                 alpha=0.1))
##################################

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length)) +
  geom_point(aes(size=Petal.Width * Petal.Length,
                  colour=Species,
                  fill=Species,
                  alpha=0.1))

