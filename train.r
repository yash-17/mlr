#loading required package
library('neuralnet')

#loading training data(source : kaggle.com)
train1 <- read.csv("../train.csv", header=TRUE)

#converting training data to suitable form for using with neuralnet package
temp <- sample(1:nrow(train1),1000)
train <- train1[temp,]
rm(train1)
labels <- as.numeric(train[,1])
train <- train[,-1]
res <- mat.or.vec(nrow(train),10)
for(row in 1:nrow(res)) 
{
    #Check for ith example
    res[row, (labels[row]+1)] <- 1
}
dimnames(res) <- list(NULL,colnames(res, do.NULL = FALSE, prefix = "label"))
res <- as.data.frame(res)
train <- merge(res,train)

#creating the formula for learning
f1 = ''
for(i in 1:10)
{
	f1 <- paste(f1,paste0('label',i,collapse=NULL),sep='+',collapse=NULL)
}
f2 = ''
for(i in 0:783)
{
	f2 <- paste(f2,paste0('pixel',i,collapse=NULL),sep='+',collapse=NULL)
}
f <- paste(f1,f2,sep='~',collapse=NULL)
f <- as.formula(f)

#training and obtaining network
net <- neuralnet(f, data=train, hidden=c(60,20), err.fct = 'ce', linear.output = FALSE, threshold = 0.01)

#loading test data(source : kaggle.com)
test1 <- read.csv("../test.csv", header=TRUE)

#computing results for test data
temp <- sample(1:nrow(test1),1000)
test <- test1[temp,]
rm(test1)
net.results <- compute(net,test)

#predicting digit values for test data
resf <- mat.or.vec(5,1)
for(row in 1:nrow(net.results$net.result))
{
	max <- 1
	for( col in 1:10 )
	{
		if (net.results$net.result[row,max] < net.results$net.result[row,col])
		{
			max <- col 
		}
	}
	resf[row] <- max
}

#removing data sets from workspace before saving
rm(train,test)

#saving workspace including trained network and predicted results on test data
save.image()
