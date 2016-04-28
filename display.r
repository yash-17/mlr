library('png')
train <- read.csv("../train.csv", header=TRUE)

labels <- as.numeric(train[,1])
train <- train[,-1]

rotate <- function(x) t(apply(x, 2, rev))

display <- function(i)
{
    row = as.numeric(train[i,])   
    dim(row) <- c(28,28)
    row <- rotate(t(row))
	row <- t(row)[ncol(row):1,]
	row <- 1 - row/255
    writePNG(row,paste0('display',as.character(labels[i]),'.png',sep='',collapse=NULL))
}

display(sample(1:nrow(train),1))
