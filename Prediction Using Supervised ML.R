#Clean the Environment
rm(list = ls(all.names = TRUE))

# install the require library
install.packages("ggplot2")
library(ggplot2)

#Import the data set
Exp<-read.csv("D:\\INTERNSHIP\\aSupervised\\Dataset.csv")

# visualize the data
ggplot(data=Exp, aes(x=Hours, y=Scores)) + geom_point()

#Fix the data split path
set.seed(12)

#rendering the data
rows<- sample(nrow(Exp))
Exp<-Exp[rows,]

#Split the data fin to ratio of training set and testing set
split<-nrow(Exp)*0.8

#training set
train<-Exp[1:split,]

#testing set
test<- Exp[(split+1):nrow(Exp),]

#Build the model
model<-lm(Scores~Hours,data = train)

#view the model
summary(model)

#prediction
predict(model,data.frame(Hours=9.25))
