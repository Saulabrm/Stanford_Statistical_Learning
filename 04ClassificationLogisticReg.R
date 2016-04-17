require(ISLR)
names(Smarket)
summary(Smarket)
?Smarket
pairs(Smarket,col=Smarket$Direction)


#Logistic regression  (glm function)
glm.fit= glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data=Smarket, family=binomial)
summary(glm.fit)  ##None are significant
glm.prob<-predict(glm.fit,type="response")  
glm.prob[1:5]
glm.pred=ifelse(glm.prob>0.5,"Up","Down")
attach(Smarket)
table(glm.pred,Direction)
mean(glm.pred==Direction)   #[1] 0.5216  Slightly better than chance.

#Make training and test set
train= Year<2005
glm.fit<- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data=Smarket,family=binomial, subset=train)
glm.probs<- predict(glm.fit,newdata=Smarket[!train,], type="response")
glm.pred=ifelse(glm.probs>0.5, "Up", "Down")
Direction.2005<- Smarket$Direction[!train]
table(glm.pred,Direction.2005)
mean(glm.pred==Direction.2005) #[1] 0.4801587 Slightly worst with the train data. May been overfitting

#Fit smaller model
glm.fit= glm(Direction~Lag1+Lag2,
             data=Smarket, family=binomial, subset=train)
glm.probs= predict(glm.fit, newdata = Smarket[!train,], type="response")
glm.pred= ifelse(glm.probs >0.5, "Up", "Down")
table(glm.pred, Direction.2005)
mean(glm.pred==Direction.2005)  ## Correct classification [1] 0.5595238
summary(glm.fit)                #Still nothing is significant.
106/(76+106)
