library('neuralnet')

train <- read.csv('../train.csv',header=TRUE)

f = 'label~pixel0'
for(i in 1:783)
{
	f <- paste(f,paste0('pixel',i,collapse=NULL),sep='+',collapse=NULL)
}
f <- as.formula(f)
#print(f)

net <- neuralnet(f, data=train, hidden=c(5,5))

print(net)
