#
plot(mini_log$V3~mini_log$V16, xlab="Error", ylab="IP", main="ERROR-IP")


# Add fit lines
#abline(lm(mpg~wt), col="red") # regression line (y~x) 
#lines(lowess(wt,mpg), col="blue") # lowess line (x,y)

#lines(lowess(mini_log$V3~mini_log$V16))


# Enhanced Scatterplot of MPG vs. Weight 
# by Number of Car Cylinders 
library(car) 
scatterplot(mpg ~ wt | cyl, data=mtcars, 
            xlab="Weight of Car", ylab="Miles Per Gallon", 
            main="Enhanced Scatter Plot", 
            labels=row.names(mtcars))


scatterplot(mini_log$V3 ~ mini_log$V16 | mini_log$V23, data=mini_log, 
            xlab="Weight of Car", ylab="Miles Per Gallon", 
            main="Enhanced Scatter Plot", 
            labels=row.names(mini_log))


# Scatterplot Matrices from the glus Package 
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data 
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r) 
cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
       main="Variables Ordered and Colored by Correlation" )
