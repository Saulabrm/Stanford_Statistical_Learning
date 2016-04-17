require(ISLR)
require(boot) 
?cv.glm             #Cross validation for Generalized Linear Models
plot(mpg~horsepower, data=Auto)

## LOOCV #Leave one out cross validation
glm.fit<- glm(mpg~horsepower,data=Auto)
cv.glm(Auto,glm.fit)$delta #pretty slow (doesnt use formula 5.2 on page 180)  (1/n Sumatory(Yi-Yhat(-i))^2)
#[1] 24.23151 24.23114  The first number is a raw leave-one out, or lieu
#The second number is a bias-corrected version of it.

#Kets write a simple function  1/n summatory((yi-yhati)^2/(1-Hii)^2)
loocv=function(fit){
  h<-lm.influence(fit)$h
  mean((residuals(fit)/(1-h))^2)
}

#Lets try it out
loocv(glm.fit)
#[1] 24.23151

cv.error<-rep(0,5)
degree<-1:5
for(d in degree){
  glm.fit<-glm(mpg~poly(horsepower,d), data=Auto)
  cv.error[d]<-loocv(glm.fit)
}

plot(degree,cv.error, type="b")

## 10-fold CV  #It is cheaper to compute (This model is favour against LOOCV)

cv.error10<-rep(0,5)
for(d in degree){
  glm.fit<-glm(mpg~poly(horsepower,d),data=Auto)
  cv.error10[d]<-cv.glm(Auto,glm.fit,K=10)$delta[1]
  }
lines(degree,cv.error10, type="b",col="red")


##Bootstrap (Easy way to do statistics when theory is very hard)
## Minimum risk investment- Section5.2

alpha<- function(x,y){
  vx=var(x)
  vy=var(y)
  cxy= cov(x,y)
  (vy-cxy)/(vx+vy-2*cxy)
}
alpha(Portfolio$X,Portfolio$Y)

#Standard error of alpha?

alpha.fn<- function(data,index){
  with(data[index,],alpha(X,Y))
}

alpha.fn(Portfolio,1:100)
#[1] 0.5758321

set.seed(1)
alpha.fn(Portfolio, sample(1:100,100,replace=TRUE))

boot.out<-boot(Portfolio,alpha.fn,R=1000)
boot.out
plot(boot.out)
