library("neuralnet")

train <- read.csv("tr.csv", header=TRUE)
test <- read.csv("ts1.csv", header=TRUE)

#Column bind the data into one variable
trainingdata <- cbind(train)
colnames(trainingdata) <- c("y","a","b","c","d")
print(trainingdata)
#Train the neural network
#Going to have 5,5,5,5 hidden layers
#Threshold is a numeric value specifying the threshold for the partial
#derivatives of the error function as stopping criteria.
net.sqrt <- neuralnet(y~a+b+c+d,trainingdata, hidden=c(20,20,20), err.fct="ce")
print(net.sqrt)
plot(net.sqrt)
net.results<-(compute(net.sqrt,test))

 
#Lets see what properties net.sqrt has
ls(net.results)
 
#Lets see the results
print(net.results$net.result)