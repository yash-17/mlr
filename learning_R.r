#To run a file, cd to the directory and run:
#Rscript <filename.r>

# This symbol means comment
# <- symbol is used for assignments

#Two statements print() and cat() can be used to print, diff is that print() append "\n"
a <- 42
A <- a * 2  # R is case sensitive
print(a)
cat(A, "\n") # "84" is concatenated with "\n"
if(A>a) # true, 84 > 42
{
  cat(A, ">", a, "\n")
} 

#Functions in R
Square <- function(x) {
  return(x^2)
}

Square(4)
print(Square(4))
print(Square(x=4)) # same thing

countdown <- function(x){
	while(x>0){
	print(x)
	x <- x-1;
	Sys.sleep(1)#sleeps for some time
	}
print(x)
}

countdown(6)

#User_Input

readInt <- function(){
	
	n <- readline("Enter an integer: ")
  	if(!grepl("^[0-9]+$",n)){ #check for integer
  	return(readInt())
	}
	return(as.integer(n))
}

if(interactive()){
print(readInt()) #This doesn't run if session is not interactive.
} 
#To make session interactive enter into R shell and write source("filename.r")