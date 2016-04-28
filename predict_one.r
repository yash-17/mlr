resize <- function(m){
	d <- dim(m)
	x <- matrix(nrow=28,ncol=28)
	rx <- floor(d[1]/28)
	cx <- floor(d[2]/28)
	for(i in 1:28)
	{
		for(j in 1:28)
		{
			x[i,j]=0
			for(k in 1:rx)
			{
				for(l in 1:cx)
				{
					x[i,j] = x[i,j] + m[(i-1)*rx + k,(j-1)*cx + l]
				}
			}
		}
	}
	x <- x
}

rotate <- function(x) t(apply(x, 2, rev))

library('jpeg')

my_image <- readJPEG('testimg.jpg')

r_val <- my_image[,,1]
g_val <- my_image[,,2]
b_val <- my_image[,,3]

grayscale <- round(((r_val + g_val + b_val)/3)*255)

im <- rotate(grayscale)

im <- resize(im)

image(im)
