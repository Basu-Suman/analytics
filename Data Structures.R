# Data Structures in R

#vectors----
x=1:10  #creates a sequence of nos from 1 to 10
x

x1 <- 1:20 #different mode of assigning and printing x
x1

(x1=1:30)  #assigning and printing simultaneously

(x2=c(1,2,13,4,5))
class(x2) #tells the class of variable, here x2=numeric

(x3=letters[1:10])
class(x3) #character class

LETTERS[1:26]

(x3b=c('a',"Dhiraj","4"))
class(x3b)


(x4=c(T,FALSE,TRUE,T,F))
class(x4) #logical variable

x5=c(3L,5L)
class(x5)  #L denotes integer

(x5b = c(1,T,4L))
class(x5b)

#access elements
(x6 = seq(0,100,by=3)) #prints values from 0 to 100 with gaps of 3

x6[20] #provides the 20th element in the array x6

ls() #lists the variables used till now

length(x6) #no of elements in x6

x6[c(2,4)] #accesses the 2nd and 4th element

x6[-1] #accesses all elements except the 1st

x6[-c(1:10)] #lists all elements except the 1st 10

x6[c(2.4, 3.54)] #real numbers are truncated to integers

sort(x6)

sort(x6, decreasing = T)

sort(x6[-c(1,2)], decreasing = T) #decrease sort with 1st 2 elements left out

seq(-3,10, by=.2)

(x = -3:2) # -3 -2 -1 0 1 2
x[2] <- 0;x # modifies the 2nd element with value 0

x
x < 0
x[x<0] = 5 #elements which are less than 0 are replaced with 5

x=x[1:4];x # truncates x to 1st 4 elements

(x=-3:3)
x[x<0]=5 & x[x>0]=10

#Deleting vectors
(x=seq(1,5, length.out=10))
x=NULL
x

(x=rnorm(100)) #random normal distribution
plot(density(x))

(x1=rnorm(1000, mean=50, sd=5))
plot(density(x1))
abline(v=mean(x1), h=0.04)



#Matrices----
1:12

100:111
(m1=matrix(1:12, nrow=4))
(m2=matrix(1:12, ncol=3, byrow=T))

x=101:124
length(x)
matrix(x, ncol=6)
class(m1)
attributes(m1)

#accessing elements of array
m1[1,2:3]
m1[c(1,3),]

paste("c","D",sep="-")
colnames(m1)=paste('c',1:3,sep='')

#vector to matrix
(m3=1:24)
dim(m3)=c(6,4)
m3

m3[m3>5 & m3<10]

m1
m1[1:2,1:2]

sweep(m1, MARGIN=1, STATS=c(2,3,4,5), FUN="+") #row wise
sweep(m1, MARGIN=2, STATS=c(2,3,4), FUN="*") #col wise

#addmargins
m1
addmargins(m1,margin=1,sum) #colwise function




#Arrays----

#Data Frame----
(rollno=1:30)
(sname=paste('student',1:30,sep=''))
(gender=sample(c('M','F'),size=30,replace=T,prob=c(.7,.3)))
(marks=floor(rnorm(30,mean=50,sd=10)))
(marks2=ceiling(rnorm(30,40,5)))
(course=sample(c('BBA','MBA'),size=30,replace=T,prob=c(.5,.5)))
rollno;sname;gender
marks;marks2;course

#create dataframe
df1=data.frame(rollno,sname,gender,marks,marks2,course,stringsAsFactors = F)
str(df1) #structure of df1
head(df1) #top6 rows
head(df1, n=3) #top3 rows
tail(df1) #last 6 rows

summary(df1)
df1$gender=factor(df1$gender)
df1$course=factor(df1$course)
summary(df1)

aggregate(df1$marks, by=list(df1$gender), FUN=max)

distribution()



#Factors----
(grades=sample(c('A','B','C','D'),size=30,replace=T,prob = c(0.4,0.2,0.3,0.1)))

table(grades)
table(gradesF)

class(gradesF)

(gradesFO=factor(grades,ordered=T))

(gradesFO1=factor(grades,ordered=T,levels=c('B','C','A','D')))
summary(gradesFO1)

(marks=ceiling(rnorm(30,mean=60,sd=5)))
(gender=factor(sample(c('M','F'),size=30,replace=T)))
(student1=data.frame(marks,gender, gradesFO1))
boxplot(marks~gradesFO1,data = student1)
boxplot(marks~gradesFO1+gender,data = student1)


boxplot(marks)
summary(marks)
abline(h=summary(marks))
