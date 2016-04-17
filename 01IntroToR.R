#Intro to Statistical Learning
### vectors, data, matrices, subsetting
x<-c(2,7,5)
x
y=seq(from=4,length=3,by=3)
?seq
y
x+y
x/y
x^y
x[2]
x[2:3]
x[-2]
x[-c(1,2)]
z<-matrix(seq(1,12),4,3)
matrix(seq(1,12), nrow=4, byrow=TRUE)
z[3:4,2:3]
z[,1]
z[,1,drop=FALSE]  # Keeps it as a matrix
dim(z)
ls()    #working directory
rm(y)
rm(list=ls()) #Clean working directory

### Generating random data, graphics
x<-runif(50)    #Random uniforms
y<-rnorm(50)    #Random normal
plot
plot(x,y, xlab="Random Uniform", 
     ylab= "Random Normal", 
     main="PLOT",pch="*",
     col="blue")
par(mfrow=c(2,1))   #Panel of plots 2 rows and 1 column
plot(x,y)
plot(y)
par(mfrow=c(1,1))

##### Reading in data
read.csv(file.choose()) #Choose the data
Auto<- read.csv("/Users/saulgarcia/Dropbox/MOOCS/Statistical Learning/Datasets/Auto.csv")
setwd("/Users/saulgarcia/Dropbox/MOOCS/Statistical Learning/Datasets")
getwd()
Auto<- read.csv("Auto.csv")
names(Auto)
dim(Auto)
class(Auto)
summary(Auto)
plot(Auto$cylinders,Auto$mpg)
plot(Auto$cyl,Auto$mpg)
attach(Auto)
search()
plot(cylinders,mpg)
cylinders<-as.factor(cylinders)
