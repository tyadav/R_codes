setwd('C:\\Users\\TejYadav\\Desktop\\watson')
getwd()

AirPassengers
mean(AirPassengers)
mean(AirPassengers, train=0.5)
x <- c(1:10, NA)
x
mean(x)
mean(x, na.rm=TRUE)

data()
?trees
trees[,2]
trees$Height
median(trees[,2])
mean(trees[,2])
v <- c(trees[,2],NA)
v
median(v)
median(v, na.rm=TRUE)

#Mode Functions

# Mode functions I have been using
MyMode <- function(x) {
  sort(table(x), decreasing=TRUE)[1]
}

# Mode function that came up online in a search
AltMode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

data()
?presidents
presidents
x <- presidents
x

m <- MyMode(x)
m
as.numeric(m)
as.numeric(names(m))

table(x)
sort(table(x), decreasing = TRUE)
sort(table(x), decreasing = TRUE)[1]
AltMode(x)
ux <- unique(x)
ux
match(x, ux)
?match

tabulate(match(x, ux))
which.max(tabulate(match(x,ux)))

ux[which.max(tabulate((match(x,ux))))]
#####
v <- sample(1:100, 10)
v
var(v)
sd(v)

v <- c(sample(1:100,10),NA)
var(v)
sd(v)
var(v, na.rm=TRUE)
sd(v, na.rm=TRUE)
?trees
var(trees[,2])
trees
sd(trees[,2])

