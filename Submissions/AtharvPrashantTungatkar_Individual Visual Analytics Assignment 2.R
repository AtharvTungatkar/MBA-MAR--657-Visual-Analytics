## Q1_1. Assign numeric value 4 to A and compute (A – 4*√𝐴)/(A+ 5*√𝐴).
## Solution
A<-4
(A-4*sqrt(A))/(A+5*sqrt(A))

## Q1_2. Create sequence of numbers that count up by 4 from 0 to 48
## Solution
seq(from=0,to=48,by=4)

## Q1_3. Use R to compute followings (2^7 = 2^7 in R)
## Case 1
(2^7)/((2^7)-1)

## Case 2
(1-(1/(2^7)))^-1

## Case 3
exp(0.4)

## Case 4
1+0.3+(0.3^2)+(0.3^3)

## Case 5
(1+0.3+(0.3^2)+(0.3^3)+(0.3^5))/5

## Q1_4. Create a matrix that consists of eight country names (number of rows = 4, number of columns = 2 and convert the matrix into data frame. Make sure if the matrix successfully changes into dataframe.
## Solution
countries=matrix(c('India','United States','Canada','United Kingdom','Australia','Russia','Singapore','Portugal'),nrow = 4)
df=as.data.frame(countries)
is.data.frame(df)

## Q1_5. Create two vectors that consist of four integer values for each and multiply the vectors.
## Example code:
##   a <- c(2L, 4L, 8L, 10L) #have to have ‘L’ after each number to indicate an integer value. 
## Solution
v1=c(2L,4L,6L,8L)
v2=c(3L,5L,7L,9L)
v1*v2


## Q1_6. Create a data frame (named friend) that includes following variables.
# name consists of four friends' names
# age consists of their ages
# momAge consists of their mothers' ages (You can make up the age)
# dadAge consists of their fathers' ages (You can make up the age)
## Solution 
name<-c('Varun','Rutvik','Sahil','Tejas')
age<-c(26,25,25,24)
momAge<-c(45,43,44,41)
dadAge<-c(48,45,44,44)
friend=data.frame(cbind(name,age,momAge,dadAge))
friend

## Q1_7. Create an additional column in the data frame (friend) that results in the total ages for the three persons in each family (= friend + mother + father).
## Solution
friend$age=as.numeric(as.character(friend$age))
friend$momAge=as.numeric(as.character(friend$momAge))
friend$dadAge=as.numeric(as.character(friend$dadAge))
friend$totalAge=friend$age+friend$momAge+friend$dadAge
friend

## Q1_8. Install and load R packages ‘ggplot2’ and ‘psych’.
## Solution
install.packages(c('ggplot2','psych'))
library('ggplot2')
library('psych')

## Q1_9. Download ‘demand1.csv’ data file from Pace Class Portal and save it in a desired folder. Import the data file into R using syntax in R script.
## Solution
demand1<-read.csv(file='C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/demand1.csv',sep=',',header = TRUE)
demand1

## Q1_10. Download ‘adSpend.csv’ data from Pace Class Portal and save it in a desired folder. Import the data file into R using syntax in R script and cbind it with ‘demand1.csv’ and name the new data frame ‘demand2.csv’. Export the ‘demand2.csv’ to a desired folder.
## Solution
adSpend<-read.csv(file='C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/adSpend.csv',sep=',',header = TRUE)
demand2<-cbind(demand1,adSpend)
write.csv(demand2,'C:/Users/athar/OneDrive/Desktop/MBA Business Analytics/Visual Analytics/Files/demand2.csv',sep=',')