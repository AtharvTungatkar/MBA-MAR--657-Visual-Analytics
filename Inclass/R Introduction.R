# ---
# title: "R Bootcamp"
# author: "Eunhee Emily Ko"
# output: html_document
# ---

####################################################################################
### 1. Entering data ###############################################################
####################################################################################

### Math 
## 1) Basic math
2+2 

## 2) Print numbers 1 to 100
1:100 # Print numbers 1 to 100 across several lines

## 3) Print characters (string)
print("Hello World") #Print Hello World 

## 4) Assigning value
# Individual values
a <- 1 # Use <- to assign
a

2 -> b # Can go other way, but not an usual way
b

b <- 3
b

c <- d <- e <- 3  # Multiple assignments
c
d
e

# Your turn: Assign the character "Hello World" to HW

# Since it is 'assign', it doesn't print / to print
a #print 
b #print
c+d+e #print (Q: what is going to be the answer for c+d+e?)

# Multiple values
x <- c(1, 2, 5, 9)  #c = Combine/concatenate
x                   #Print contents of x in Console
#A vector is simply a list of items that are of the same type.

#To combine the list of items to a vector, use the c() function 
#and separate the items by a comma.

# Does 'x <- 1,2,5,9' work?

## 5) Entering sequences
# 0 through 10 and 10 through 0
0:10           
10:0          

# Another way to create sequential data
seq(10)        #1 to 10
seq(30, 0, by = -3)       #Count down by 3

## 6) Math
x <- c(1, 2, 5, 9)
x
(y <- c(5, 1, 0, 10))
# Surround command with parentheses to print

x + y         # Adds corresponding elements in x and y
x*2           # Multiplies each element in x by 2

2^6           # Powers/exponents = 2*2*2*2*2*2
sqrt(64)      # Square root
log(100)      # Natural log: base e (2.71828...)
log10(100)    # Base 10 log

####################################################################################
### 2. Data types: numeric, character, logical#####################################
####################################################################################

## 1) Numeric 1
n1 <- 15 #assign 15 to n1  
n1 #print
typeof(n1) # Data type of n1? Double (essentially same to numeric variable)

## 2) Numeric 2
n2 <- 1.5
n2 #print
typeof(n2) # Data type of n2? Double

## 3) Character 1
c1 <- "c" 
c1  
typeof(c1)

c2 <- "2"
typeof(c2)
#(Q: what is the data type of c2? if c2 <- "2")

## 4) Character 2
c2 <- "a string of text" #can assign a phrase consisting of several words or letters
c2  
typeof(c2)

## 5) Logical 1
# What is logical? TRUE and FALSE (or T and F) are 
# reserved words denoting logical constants in the R language 

l1 <- TRUE
l1
typeof(l1)

## 6) Logical 2
l2 <- FALSE
l2
typeof(l2)

###################################################################################
### 3. Data structures: scalars, vectors, matrices, data frames ###################
###################################################################################

## 1) Scalar: A scalar data structure is the most basic data type 
# that holds only a single atomic value at a time.
a <- 9 # create a scalar named 'a' that stores the value 9

## 2) Vector: a list of items: Vectors have several elements. 
# all members should be of the same data type
a <- c(1,2,5.3,6,-2,4) # numeric vector
a
# note that a is not 9 anymore
# The previous assignment (a <- 9) is not effective anymore
# if you assign a new value to the same object (a <- c(1,2,5.3,6,-2,4))
b <- c("one","two","three") # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

is.vector(a)

# Question: c("2", "3", "4", "9") <- Is this a numeric vector or character vector?

## 3) Matrices: elements are arranged in a two-dimensional rectangular layout.
# All columns in a matrix must have the same mode (numeric, character, etc.) 
# and the same length. 

# Create m1 matrix consisting of logical values
m1 <- matrix(c(T, T, F, F, T, F), nrow = 2) #number of rows = 2
# Question: How many columns will be created?
m1
is.matrix(m1)

# By default, the element is assigned by column.

# Create m2 matrix consisting of character values 
m2 <- matrix(c("a", "b","c", "d"),
             nrow = 2, #number of rows = 2
             byrow = T) # assign a value by row/ default is by column
m2

matrix(1:6, nrow = 3, ncol = 2, byrow = T) # by row

matrix(1:6, nrow = 3, ncol = 2) # by column (default)

## 4) Data frame 
# A two-dimensional rectangular layout
# column represents a variable and each row represents a unit of observation.
# Can store different data types in different columns 
# Every item within a particular column has to be of the same type
vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

#cbind to combine the three vectors
df1 <- cbind(vNumeric, vCharacter, vLogical) #produce a matrix 
df1  
is(df1)

df2 <- data.frame(vNumeric, vCharacter, vLogical) #create a data frame
df2 

is(df2$vNumeric) # '$' separates a data set from a variable within the data set
is(df2$vCharacter)
is(df2$vLogical)

names(df2) <- c("number","character","logical") # change variable names
df2

####################################################################################
### 4. Useful functions ############################################################
####################################################################################

#General useful functions
length(df2) # returns the number of columns
length(df2$number) #number of elements or components
str(df2)    # structure of an object
class(df2)  # class or type of an object
names(df2)  # names

c(1,2,3,4,5)       # combine objects into a vector

##cbind 
cbind(object, object, ...) # combine objects as columns

#Example of cbind
Name <- c("Suzy", "Nate", "Michael")
Age <- c(13, 15, 19)
FavoriteS <- c("math", "science", "math")

df3 <- cbind(Name,Age,FavoriteS)
df3
 
df3 <- data.frame(df3)
df3
is(df3)

##rbind
rbind(object, object, ...) # combine objects as rows

# Example of rbind
Name <- c("Minjo", "Eva")
Age <- c(17, 17)
FavoriteS <- c("science", "social studies")

df4 <- data.frame(Name,Age,FavoriteS)
df4

df5 <- rbind(df3, df4)
df5

####################################################################################
### 5. Useful operators ############################################################
####################################################################################

# addition: +
x <- 5 #Question: x is a scalar? a vector? or a matrix?
y <- 23

x+y

# subtraction: - 
x-y

# multiplication: *
x*y

# division: /
x/y

# exponentiation: ^
x^y

# less than: <
# less than or equal to: <=
# greater than: >
# greater than or equal to: >=
# exactly equal to: ==
# not equal to: !=
# not x: !x
# x OR y: x|y
# x AND y: x&y

# Note: Difference between = and == : = functions as an assignment (<-) 
# while == is a logical operator for comparison

# Operator example 1
x <- c(1:10)
x
x[(x>8) | (x<5)] #yield 1 2 3 4 9 10

# Operator example 2
x[(x>8)] #yield 9 10

# Operator example 3
x <- c(12,4,14)
y <- c(3,4,15)
x != y # negation (x is not equal to y)/ this will produce logical values

####################################################################################
### 6. Header and comment ##########################################################
####################################################################################

### Format
## Data types
# Numeric, character, logical

## ---------------------------
##
## Script name: 
##
## Purpose of script:
##
## Author:  
##
## Date Created:  
##
## Email:  
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

## Comment examples
# Operator example 1
x <- c(1:10)

x != y # negation
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows

# In-class exercise (10 min): Create headers or comments for the code that you created above

####################################################################################
### 7. Packages for R ##############################################################
####################################################################################

## Install packages: Method 1
install.packages("lattice")
install.packages("stringr")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("foreign")
install.packages("MASS")
install.packages("plotly")

## Install packages: Method 2
# In packages, plots, files pane, manually do it

## Load a package
library(ggplot2)
library(plotly)
require(foreign)

# Whenever you start a new R session, you have to load a package (no need to install again) 
# that you will use

####################################################################################
### 8. Importing and writing data ##################################################
####################################################################################

## Delimiter: tap-delimited, commas (,), semicolon (;), pipes (|), slashes (\ or /)
# "A delimiter is a sequence of one or more characters for specifying 
# the boundary between separate, independent regions in plain text, 
# mathematical expressions or other data streams. An example of a delimiter 
# is the comma character, which acts as a field delimiter in a sequence 
# of comma-separated values" - wikipedia -

## Delimiter example 1
#john|doe|male|123 street|555-1234
#jane|smith|female|321 street|555-4321
#bill|gates|male|987 street|555-9876

## Delimiter example 2 (csv)
#john,doe,male,123 street,555-1234
#jane,smith,female,321 street,555-4321
#bill,gates,male,987 street,555-9876

#Show the examples of data1.txt, data2.txt, data3.csv.

## If your data is saved as tab-delimited text file or *.txt file with header (default is tab-delimiter so no need to specify "sep = ")
df1 <- read.table(file = "C:/Pace University/Mar657_Visual analytics/Spring 2025/Lecture slide/Module 3. Introduction of R/data1.txt", header = T)


## Mac: df1 <- read.table(file = "/Users/ehk994/Desktop/Teaching/Basic tutorial for R/data1.txt", header = TRUE)
# Find the path to the file: Open the folder where the specific file is saved -->
# Get info
# https://www.youtube.com/watch?v=gxU1wlBAsig&t=50s

## If your data is saved using another delimeter (i.e. /) without header
df2 <- read.table(file = "C:/Pace University/Mar664_Predictive analytics/Spring 2025/Module 2_R introduction and data exploration/Final/data2.txt", sep = "/", header = F)
df2 <- read.table(file = "C:/Pace University/Mar664_Predictive analytics/Spring 2025/Module 2_R introduction and data exploration/Final/data2.txt" , header = F)


## If your data is saved using csv file (delimeter = ,) with header
df3 <- read.csv(file = "C:/Pace University/Mar664_Predictive analytics/Spring 2025/Module 2_R introduction and data exploration/Final/data3.csv", header = T)

## Write csv file
write.csv(df3, file = "C:/Pace University/Mar664_Predictive analytics/Spring 2025/Module 2_R introduction and data exploration/Final/write_df1.csv", row.names=TRUE)

## Export data set to a tab-separated file
write.table(df2, file = "C:/Pace University/Mar664_Predictive analytics/Spring 2025/Module 2_R introduction and data exploration/Final/write_df2.txt", sep = "\t", row.names = FALSE)

####################################################################################
### 9. Subset ######################################################################
####################################################################################
# Parentheses are for functions, brackets are for indicating the position of items 
# in a vector or matrix.

## Read data file
titanic <- read.csv("C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/titanic.csv",header = TRUE)

## Select variables (i.e., columns)
# Select certain variables with their variable names
myvars <- c("Survived", "Pclass", "Name")
col_titanic_sub <- titanic[myvars]

# Select 1st and 5th through 8th variables
col_titanic_sub2 <- titanic[c(1,5:8)]

## Exclude 3rd and 5th variable
col_titanic_sub3 <- titanic[c(-3,-5)]

## Select observations (i.e., rows)
# Select first 5 obesrvations
row_titanic_sub1 <- titanic[1:5,]

# Select observations based on variable values
row_titanic_sub2 <- titanic[which(titanic$Sex=="female" 
                                   & titanic$Age > 35), ]

# Use subset function
row_titanic_sub3 <- subset(titanic, Age >= 20 | Age < 10,
                           select=c(Survived, Pclass, Age)) 

# Use subset function 
row_titanic_sub4 <- subset(titanic, Sex=="male" & Age > 25,
                       select=Survived:Age) 

# Random samples
# take a random sample of size 50 from a dataset titanic
# sample without replacement
random_titanic <- titanic[sample(1:nrow(titanic), 50,
                                 replace=FALSE),] 

####################################################################################
### 10. Simple visualization #######################################################
####################################################################################

# Read Titanic dataset
titanic <- read.csv("C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/titanic.csv", sep = ",", header = TRUE)

# Simple Bar Plot
counts <- table(titanic$Pclass)
counts
barplot(counts, main="Passenger Distribution",
        xlab="Class Level") 

# Grouped Bar Plot
counts <- table(titanic$Survived, titanic$Pclass)
counts
barplot(counts, main="Passenger Distribution by Survived and 
        Class",xlab="Class Level", col=c("darkblue","red"),legend  
        = rownames(counts), beside=TRUE)

barplot(counts, main="Passenger Distribution by Survived and 
        Class",xlab="Class Level", col=c("darkblue","red"), beside=TRUE)

legend("topright",
       legend = rownames(counts),pch = 16,
       col = 1:nrow(counts))

#pch = different symbol

#pch = 0,square
#pch = 1,circle
#pch = 2,triangle point up
#pch = 3,plus
#pch = 4,cross
#pch = 5,diamond
#pch = 6,triangle point down
#pch = 7,square cross
#pch = 8,star
#pch = 9,diamond plus
#pch = 10,circle plus
#pch = 11,triangles up and down
#pch = 12,square plus
#pch = 13,circle cross
#pch = 14,square and triangle down
#pch = 15, filled square
#pch = 16, filled circle
#pch = 17, filled triangle point-up
#pch = 18, filled diamond
#pch = 19, solid circle
#pch = 20,bullet (smaller circle)
#pch = 21, filled circle blue
#pch = 22, filled square blue
#pch = 23, filled diamond blue
#pch = 24, filled triangle point-up blue
#pch = 25, filled triangle point down blue

counts <- table(titanic$Pclass, titanic$Survived)
counts
barplot(counts, main="Passenger Distribution by Survived and 
        Class",xlab="Survided", col=c("darkblue","red", "darkgreen"),legend  
        = rownames(counts), beside=TRUE)

# Boxplot of Fare by Pclass
boxplot(Fare~Pclass,data=titanic, main="Boxplot",
        xlab="Class Level", ylab="Fare of Tickets")

# Simple Pie Chart
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "Korea", "China", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Simple Scatterplot for two numerical variables
plot(titanic$Age, titanic$Fare, main="Scatterplot Example",
     xlab="Age", ylab="Fare ", pch=19)

## R data visualization references:

#https://rkabacoff.github.io/datavis/
  
#https://r4ds.had.co.nz/data-visualisation.html

#https://r-graph-gallery.com/ggplot2-package.html

##R color references:
  
#https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization/
  
#https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf