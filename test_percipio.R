?trees
g <- trees$Girth
g
median(g)
mad(g)
mean(g)
mad(g, center=mean(g))
mad(g, constant = 1.4826)
mad(g, constant = 1)
mad(g, constant = 2)
g
g <-c(g,NA)
g
mad(g)
###########
#Measure the relationship between 2 variance

?faithful
head(faithful)
e <- faithful$eruptions
w <-faithful$waiting
plot(e,w)
cov(w,e)
cor(w,e)
cor(w,e, method = "pearson")
cor(w,e, method = "spearman")
cor(w,e, method = "kendall")
cor(w,e, use="everything")
?cor
##################
?airquality
head(airquality)
table(OzHi = Ozone > 80, Month)
#####

library(MASS)
attach(survey)      
head(survey)
table(Smoke)
table(Sex, Smoke)
table(Sex, Smoke), useNA=("ifany")
######################

#1. Usage share of desktop browsers for June 2014

browsers <- c("Chrome", "Internet Explorer", "Firefox",
              "Safari", "Opera", "Other")
share <- c(38, 19, 16.8, 16, 3.2, 6)
colors <- c("red", "yellow", "blue", "green",
            "orange", "cyan")
pie(share, browsers, col=colors)
pie(share, browsers, col=colors, radius=1.2)
pie(share, browsers, col=colors, radius=1)
pie(share,browsers, col=colors, radius=1, clockwise=TRUE)
?pie
##################
# bar plots
browsers <- c("Chrome", "Internet Explorer", "Firefox",
              "Safari", "Opera", "Other")
share <- c(38, 19, 16.8, 16, 3.2, 6)
colors <- c("red", "yellow", "blue", "green",
            "orange", "cyan")
barplot(share, names.arg = browsers)
barplot(share, names.arg = browsers, col=colors, ylim=c(0,40),
        horiz=TRUE)
########################
# Boxplot
attach(morley)
boxplot(Speed ~ Expt, morley, xlab="Experiment No.",
        ylab="Speed(km/s minus 299,000")
abline(h=792.458, col="red")
text(3,792.458, "true\nspeed")

#############################
# Histogram

?airquality
hist(airquality$Temp)
hist(airquality$Wind)
hist(airquality$Ozone)

colors <- c("red", "yellow", "blue", "green")
hist(airquality$Wind,
     freq=F,
     right=F,
     col = colors,
     breaks=19,
     main="New York Wind Speed",
     xlab="Wind Speed")

lines(density(airquality$Wind, bw=0.6),
      col="black",
      lwd=3)
######################
# Line plots
v <- sample(1:100, 10)
v
plot(v)
plot(v, type="l", col="blue", ylim=c(0,100))

plot(v, type="b", col="blue", ylim=c(0,100))
plot(v, type="o", col="blue", ylim=c(0,100))

x <- sample(1:100, 10)
lines(x, type="o", col="red")

title(main="Main Title", col.main="blue")

#############################
# Scatter Plots
?airquality
x = airquality$Ozone
y = airquality$Wind
plot(x,y,xlab="Ozone (ppb)", ylab="Wind Speed (mph)")
abline(lm(y ~ x))

library(ggplot2)
sp <- ggplot(airquality, aes(x = airquality$Ozone,
                             y = airquality$Wind))
sp + geom_point()

sp + geom_point(shape=1)
sp + geom_point(shape=1) + geom_smooth(smooth=lm)
###################
# Exporting Graphics

jpeg("AirPassengers.jpg")
plot(AirPassengers)
dev.off()

pdf("AirPassengers.pdf")
plot(AirPassengers)
dev.off

win.metafile("AirPassengers.wmf") # Windows metafile format
plot(AirPassengers)
dev.off()

png("AirPassengers.png")
plot(AirPassengers)
dev.off()

bmp("AirPassengers.png")
plot(AirPassengers)
dev.off

postscript("AirPassengers.ps")
plot(AirPassengers)
dev.off()

setEPS()
postscript("AirPassengers.eps") # encapsulated postscript
plot(AirPassengers)
dev.off()


