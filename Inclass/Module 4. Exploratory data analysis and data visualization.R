#---
#title: "Exploratoy analysis and data manipulation"
#author: "Emily Ko"
#output: html_document
#---
## Univariate non-graphical EDA: categorical data
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
mTable <- table(mpg$manufacturer) #one variable: manufacturer
mcTable <- table(mpg$class)

prop.table(mTable)
prop.table(mcTable)

## Univariate non-graphical EDA: quantitative data
summary(mpg$displ)

library(psych)
describe(mpg$displ)

## Univariate graphical EDA: categorical data: histogram
library(ggplot2)
ggplot(mpg, aes(x = factor(cyl))) +
  geom_bar() # Most basic bar chart

ggplot(mpg, aes(x = factor(manufacturer))) +
  geom_bar() # Most basic bar chart

## Univariate graphical EDA: categorical data: Pie chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# ## Univariate graphical EDA: categorical data: Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

## Univariate graphical EDA: quantitative data: histogram
# Create an 'eda1' data vector
eda1 <- c(3,5,4,9,3,5,3,7,6,4,8,5,1,4,5,4,3,4,1,3,5,5,5,7,1,5,6,2,1,
          7,5,9,1,2,1,5,3,3,3,5,4,6,7,3)

hist(eda1)

# Different numbers of bins
eda2 <- c(4.12,7.05,1.31,6.64,3.46,4.88,7.56,7.25,1.11,4.19,10.72,-0.95,0.29,3.05,0.64,2.83,2.41,4.97,7,5.8,11.73,
          1.94,7.99,3.84,4.87,3.13,2.17,7.87,4.52,7.32,3.3,1.79,8.38,0.42,5.28,6.94,3.55,6.61,5.44,7.74,12.71,13.29,
          12.29,12.58,10.63,15.53,18.28,13.32,10.06,20.4,11.12,12.61,4.97,7.96,13.27,12.01,13.79,15.04,13.88,15.51,
          11.66,16.23,13.58,13.53,11.4,11.86,13.68,15.53,9.69,9.06,14.65,7.71,15.45,6.77,15.72,15.15,7.59,14.7,12.94,10.01)

hist(eda2)
hist(eda2, breaks = 5)
hist(eda2, breaks = 3)

## Univariate graphical EDA: quantitative data: boxplot
# Create an 'eda1' data vector
eda1 <- c(3,5,4,9,3,5,3,7,6,4,8,5,1,4,5,4,3,4,1,3,5,5,5,7,1,5,6,2,1,
          7,5,9,1,2,1,5,3,3,3,5,4,6,7,3)

## Boxplot
boxplot(eda1)
 
## Multivariate non-graphical EDA: cross-tabulation for categorical
table(mpg$fl, mpg$class)
View(mpg)

## In-class exercise: bank data
bank <- read.csv(file ="C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/bank.csv")
bankT <- table(bank$marital, bank$loan)
bankT2 <- table(bank$housing, bank$loan)

prop.table(bankT)


## Multivariate non-graphical EDA: Covariance and correlation for two quantitative variables
print(cov(mpg$displ, mpg$hwy)) 
print(cor(mpg$displ, mpg$hwy)) 

## Multivariate non-graphical EDA: Covariance and correlation for more than two quantitative variables
# import cpg data
CPG <- read.csv(file = "C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/cpg.csv")
print(cov(CPG)) 
print(cor(CPG)) 

# In-class exercise:new product data
nProduct <- read.csv(file = "C:/Pace University/Mar657_Visual analytics/Fall 2024/Lecture slide/Module 4. Exploratory data analysis and data visualization/new_product.csv")
names(nProduct)
print(cov(nProduct$Sales, nProduct$DWBconcept)) 
print(cor(nProduct$Sales, nProduct$DWBconcept))

print(cov(nProduct$Sales, nProduct$Uniqueness)) 
print(cor(nProduct$Sales, nProduct$Uniqueness))

print(cov(nProduct$Sales, nProduct$DWBproto)) 
print(cor(nProduct$Sales, nProduct$DWBproto))

print(cor(nProduct))
## Multivariate graphical EDA: bar plots for categorical variables
data(mtcars)

# Simple Bar Plot for one categorical variable
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")
counts <- table(mtcars$vs)
barplot(counts, main="Car Distribution",
        xlab="Number of VSs")

# Stacked Bar Plot for two categorical variables
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))

# Grouped Bar Plot for two categorical variables
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

## In-class exercise: bank data
counts <- table(bank$marital, bank$housing)
barplot(counts, main="Marital Status Distribution by Housing",
        xlab="Housing", col=c("darkblue","red", "darkgreen", "yellow"),
        legend = rownames(counts))

barplot(counts, main="Marital Status Distribution by Housing",
        xlab="Housing", col=c("darkblue","red", "darkgreen", "yellow"),
        legend = rownames(counts), beside=T)

## Multivariate graphical EDA: quantitative variables
CPG #CPG data

plot(CPG$AdSpend, CPG$Price)

## Multivariate graphical EDA: quantitative variables and categorical variables
# Enhanced Scatterplot of MPG vs. Weight
# by Number of Car Cylinders
 
plot(mtcars$wt, mtcars$mpg, col=as.factor(mtcars$cyl), pch=19)

# Box plot by group
boxplot(mtcars$wt ~ mtcars$cyl)


 