#Practise Exercise-XIMB

#Create a 100 row DF with following Variables
#gender,spl,age,experience,grade,placement

emp.data <- data.frame(
  student_id = c (1:100),
  gender=sample(c('M','F'),size=100,replace=T),
  spl=sample(c('MArketing','Finance','HR'),size=100,replace = T),
  age=sample(c(21:30),size=100,replace = T),
  experience=floor(rnorm(100, mean=4, sd=1)),
  grade=sample(c('A','B','C','D'),size=100,replace = T,prob=c(.4,.3,.2,.1 )),
  placement=sample(c('Y','N'),size=100,replace = T),
  stringsAsFactors = F
  )
print(emp.data)
class(emp.data)
emp.data[] <- lapply( emp.data, factor)

summary(emp.data)

plot(emp.data)
plot(emp.data, pch=15, col='red')
plot(emp.data, x=c(emp.data$spl), y=c(emp.data$gender), pch=10)

library(dplyr)
emp.data %>% group_by(placement,gender) %>% summarise(mean(experience),max(experience),mean(age))

emp.data %>% filter(spl=='Marketing' & grade=='A') %>% group_by(spl) %>% summarise(mean(experience))


pairs(emp.data[,c('age','experience')])

par(mfcol=c(2,2))
pie(table(emp.data$gender))
pie(table(emp.data$placement))
pie(table(emp.data$grade))
pie(table(emp.data$spl))

par(mfrow=c(1,1))

write.csv(emp.data, file = "./data/emp.data.csv")

emp2.data=read.csv('./data/emp.data.csv')
head(emp2.data)


#clustering
km3=kmeans(emp.data[,c('age','experience')],centers=3)
km3
km3$centers
plot(emp.data[,c('age','experience')],col=km3$cluster)


#decision tree
library(rpart)
library(rpart.plot)

tree=rpart(placement~.,data=emp.data)
tree
rpart.plot(tree, nn=T, cex = .8)
printcp(tree)

ndata=sample_n(emp.data,3)
ndata


#logistic regression

logitmodel1=glm(placement~.,data=emp.data)
summary(logitmodel1)

#linear regression

linear1=lm(age~.,data = emp.data)
summary(linear1)
