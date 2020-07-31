getwd()


# builtin dataframes
state.x77
women
WorldPhones

head(state.x77)
tail(state.abb)
str(state.x77)
summary(state.x77)

# Dataframe

days <- c('mon','tue','wed','thu','fri','sat','sun')
temp <- c(22.2, 21, 23,24,25,22,24)
rain <- c(T,T,F,F,F,T,F)
data.frame(days,temp,rain)
df <- data.frame(days,temp,rain)
df
str(df)
summary(df)

data()

df[1,2]

df[,'rain']
df[1:5,c('days','temp')]

df$days
df$rain
df['days']

subset(df,subset = rain==TRUE)

subset(df,subset = temp>23)

# sort by order
sorted.temp <- order(df['temp'])
sorted.temp

df[sorted.temp,]
desc.temp <- order(-df['temp'])
desc.temp
df[desc.temp,]

desc.temp <- order(-df$temp)
df[desc.temp,]
############################

empty <- data.frame()
c1 <- 1:10
c1
letters
c2 <- letters[1:10]
c2
df <- data.frame(col.name.1 = c1, col.name.2 = c2)
df

############################

write.csv(df,file = 'saved_df.csv')
df2 <- read.csv('saved_df.csv')
df2
nrow(df)
ncol(df)
colnames(df)
rownames(df)
str(df)
summary(df)
df[[5,2]]
df[[2,'col.name.2']]
df[[1,'col.name.2']]<- 9999
df

df[1,]
# Referencing columns
mtcars

head(mtcars)
# 4 different ways 
mtcars$mpg
mtcars[,'mpg']
mtcars[,1]
mtcars[['mpg']]

# df with a col
mtcars['mpg']

mtcars[1]

head(mtcars[c('mpg','cyl')])
df
# Adding cols
df2 <- data.frame(col.name.1 = 2000, col.name.2 = 'new')
df2
dfnew <- rbind(df, df2)
dfnew

df$newcol <- 2*df$col.name.1
df
df$newcol.copy <- df$newcol
head(df)
df
# Setting column Names
colnames(df)
colnames(df) <- c('1','2','3','4')
head(df)
colnames(df)[1] <- 'NEW COL NAME'
head(df)

# Select multiple rows
df[1:10,]

df[1:3,]
head(df)
head(df,7)

df[-2,]

head(mtcars)
mtcars[ mtcars$mpg > 20,] # , for all the columns

head(mtcars)
mtcars[ mtcars$mpg > 20 & mtcars$cyl == 6, ]

mtcars[ (mtcars$mpg > 20) & (mtcars$cyl == 6), c('mpg','cyl','hp') ]
subset(mtcars, mpg > 20 & cyl == 6)

mtcars[, c(1,2,3)]

mtcars[, c('mpg','cyl')]

# Dealing with missing data
is.na(mtcars)
any(is.na(df))
       
df[is.na(df)] <- 0
df    
df$`2`[is.name(df$`2`)] <- mean(df$`2`)
df
##############################
# Recreate a df
Name <- c('Sam','Frank','Amy')
Age <- c(22,25,26)
Weight <- c(150, 165, 120)
Sex <- c('M',"M",'F')

df <- data.frame(row.names = Name, Age, Weight, Sex)
print(df)

###########################

rownames(df) <- c('A','B','C')
df

# Is mtcars is a dataframe
is.data.frame(mtcars)

# Use as.data.frame() to convert a matrix into a dataframe
mat <- matrix(1:25, nrow = 5)
mat
as.data.frame((mat))
###########################

df <- mtcars
head(df)

head(df, 9)

df$mpg

# Average mpg for all vehicles
mean(df$mpg)

# select the rows where all cars have 6 cylinders
df[df$cyl == 6,]

subset(df, cyl==6)
# select the columns an, gear and carb
df[,c('am','gear','carb')]

# Create a new col performance which calculated by hp/wt

df$performance <- df$hp/df$wt
head(df)

# Figure out how to use round() (check help round) to reduce this accuracy to only 2 decimal places
help(round)

df$performance <- round(df$performance,digits=2)
head(df)

# what is the average mpg for cars that have more than 
# 100 hp AND wt value of more than 2.5

subset(df,hp>100 & wt > 2.5)$mpg
mean(subset(df,hp>100 & wt > 2.5)$mpg)

df[df$hp > 100 & df$wt >2.5, ]$mpg
mean(df[df$hp > 100 & df$wt >2.5, ]$mpg)

# What is the mpg of the Hornet sport about?

df['Hornet Sportabout',]
df['Hornet Sportabout',]$mpg

#########################################

