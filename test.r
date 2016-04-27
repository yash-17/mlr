library('neuralnet')

train <- read.csv("../train.csv", header=TRUE)

r <- sample(1:nrow(train),5)
train1 <- train[r, ]
labels <- as.numeric(train1[,1])
train1 <- train1[,-1]

res <- mat.or.vec(5,10)

for(row in 1:nrow(res)) {
    #Check for ith example
    res[row, (labels[row]+1)] <- 1
    }

dimnames(res) <- list(NULL,colnames(res, do.NULL = FALSE, prefix = "label"))

res <- as.data.frame(res)

train1 <- merge(res,train1)


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
#print(f)

#print(train1)

net <- neuralnet(f, data=train1, hidden=c(6), err.fct = 'ce', linear.output = FALSE, threshold = 0.1)

print(net)

plot(net)
