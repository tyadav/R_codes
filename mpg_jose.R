library(ggplot2)
head(mpg)

pl <- ggplot(mpg,aes(x=hwy)) + geom_histogram()
print(pl)

pl <- ggplot(mpg,aes(x=hwy)) + geom_histogram(bins=20,fill='red', alpha=0.5)
print(pl)

pl <- ggplot(mpg,aes(x=manufacturer))
pl2 <- pl + geom_bar(fill='blue')
pl2 <- pl + geom_bar(aes(fill=cyl))
print(pl2)


head(txhousing)

pl <- ggplot(txhousing,aes(x=sales,y=volume))
pl2 <- pl + geom_point(color='blue', alpha=0.3)
pl3 <- pl2 + geom_smooth(color='red')

print(pl3)

