##Linear Regression

#Datasets
library(MASS)
library(ISLR)

###Simple linear regression
names(Boston)
?Boston
plot(medv~lstat,Boston)
fit1<-lm(medv~lstat,data = Boston)    #Response on the left side
summary(fit1)
abline(fit1,col="red", lwd=3)
names(fit1)                           #The components of the linear model.
confint(fit1)                         #Confidence interval for the coeficients.
predict(fit1,data.frame(lstat=c(5,10,15)), interval= "confidence")

### Multiple linear regression
fit2= lm(medv~lstat+age, data=Boston)   #Now we have more than one variable
summary(fit2)
fit3=lm(medv~.,Boston)

par(mfrow=c(2,2))
plot(fit3)

fit4<-update(fit3, ~.-age-indus)
plot(fit4)
summary(fit4)

### Non linear terms and Interactions

fit5<-lm(medv~lstat*age, Boston)
summary(fit5)
fit6<-lm(medv~lstat + I(lstat^2), Boston); summary(fit6)
attach(Boston)
par(mfrow=c(1,1))
plot(medv~lstat)
points(lstat, fitted(fit6), col="red",pch=20)

fit7<-lm(medv~poly(lstat,4)) #Easier way to fit polynomials
points(lstat, fitted(fit7), col="blue", pch=20)
plot(1:20,1:20,pch=1:20,cex=2)   #Characters for plotting

###Qualitative predictors
fix(Carseats)
names(Carseats)
summary(Carseats)
fit1<-lm(Sales~.+Income:Advertising+Age:Price,Carseats) #Sales against everything, with interaction terms 
summary(fit1)
contrasts(Carseats$ShelveLoc) #To find how is qualitative fvariavles defined.

###Writing R functions

regplot=function(x,y){
  fit=lm(y~x)
  plot(x,y)
  abline(fit,col="red")
}
attach(Carseats)
regplot(Price,Sales)

regplot=function(x,y,...){
  fit=lm(y~x)
  plot(x,y,...)
  abline(fit,col="red")
}
regplot(Price,Sales,xlab="Price", ylab="Sales",col="blue", pch=20)

