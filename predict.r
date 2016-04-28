resize <- function(m)
{
	d <- dim(m)
	x <- mat.or.vec(28, 28)
	rx <- floor(d[1]/28)
	cx <- floor(d[2]/28)
	for(i in 1:28)
	{
		for(j in 1:28)
		{
			for(k in 1:rx)
			{
				for(l in 1:cx)
				{
					x[i,j] = x[i,j] + m[(i-1)*rx + k,(j-1)*cx + l]
				}
			}
		}
	}
	x <- x/(rx*cx)
}

rotate <- function(x) t(apply(x, 2, rev))

library('jpeg')
library('png')

my_image <- readJPEG('three.jpg')

r_val <- my_image[,,1]
g_val <- my_image[,,2]
b_val <- my_image[,,3]

grayscale <- ((0.2989*r_val + 0.5870*g_val + 0.1140*b_val))

im <- resize(grayscale)

im <- round(im)
writePNG(im,'predict.png')

im <- round((1-im)*255)
