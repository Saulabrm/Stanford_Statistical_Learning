require(ISLR)
##K-nearest Neighboor
library(class)      #Set up to use KNN
?knn                #Ask for the train variables, Test variables, and number of K
attach(Smarket)
Xlag<- cbind(Lag1,Lag2)
train<-Year<2005
knn.pred<-knn(Xlag[train,], Xlag[!train,], Direction[train], k=1)
table(knn.pred, Direction[!train])
mean(knn.pred==Direction[!train])  ##[1] 0.5 1 nearest neighbor, is no better than flipping a coin
