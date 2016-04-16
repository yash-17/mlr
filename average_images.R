# averages the images, for uses as prospect

library(png)

train <- read.csv("train.csv", header=TRUE)

labels <- as.numeric(train[,1])
train <- train[,-1]

bigify <- function(im, r){
    result <- matrix(nrow=nrow(im)*r, ncol=ncol(im)*r)
    for(i in 1:nrow(im)){
        for(j in 1:ncol(im)){
            for(k in 1:r){
                for(l in 1:r){
                    result[(i - 1) * r + (k - 1) + 1, (j - 1) * r + (l - 1) + 1] <- im[i, j]
                }
            }
        }
    }
    return(result)
}

temp <- sample(1:nrow(train),10)

images <- list()

a <- ''

for(x in 1:10){
    #average <- colMeans(train[labels == x,])
    image <- colMeans(train[ temp[x] , ])
	im <- t(matrix(1-image/256, nrow = 28))
    im <- bigify(im, 8)
    images[[as.character(x)]] <- im
	a <- paste(a,as.character(labels[temp[x]]),sep="",collapse="")
}

row1 <- matrix(nrow=28*8)
for(i in 1:5){
    row1 <- cbind(row1, images[[as.character(i)]])
}
row1 <- row1[,-1] # kills the NA row

row2 <- matrix(nrow=28*8)
for(i in 6:10){
    row2 <- cbind(row2, images[[as.character(i)]])
}
row2 <- row2[,-1] # kills the NA row

writePNG(rbind(row1, row2), paste(a,'.png',sep="",collapse=""))
print(a)
