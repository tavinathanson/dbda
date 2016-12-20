# Probability mass under normal curve, from 
# mu - sigma to mu + sigma

source("DBDA2Eprograms/DBDA2E-utilities.R")
# Graph of normal probability density function, with comb of intervals.
meanval = 0.0               # Specify mean of distribution.
sdval = 0.2                 # Specify standard deviation of distribution.
xlow  = meanval - sdval # Specify low end of x-axis.
xhigh = meanval + sdval # Specify high end of x-axis.
dx = sdval/40               # Specify interval width on x-axis
# Specify comb of points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = ( 1/(sdval*sqrt(2*pi)) ) * exp( -.5 * ((x-meanval)/sdval)^2 )
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
openGraph(width=7,height=5)
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
      , xlab="x" , ylab="p(x)" , cex.lab=1.5 ,
      , main="Normal Probability Density" , cex.main=1.5 )
lines( x , y , lwd=3 ,  col="skyblue" )
# Approximate the integral as the sum of width * height for each interval.
area = sum( dx * y )
# Display info in the graph.
text( meanval-sdval/4 , .9*max(y) , bquote( paste(mu ," = " ,.(meanval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval-sdval/4 , .75*max(y) , bquote( paste(sigma ," = " ,.(sdval)) )
      , adj=c(1,.5) , cex=1.5 )
text( meanval+sdval/4 , .9*max(y) , bquote( paste(Delta , "x = " ,.(dx)) )
      , adj=c(0,.5) , cex=1.5 )
text( meanval+sdval/4 , .75*max(y) ,
      bquote(
        paste( sum(,x,) , " " , Delta , "x p(x) = " , .(signif(area,3)) )
      ) , adj=c(0,.5) , cex=1.5 )
# Save the plot to an EPS file.
saveGraph( file = "IntegralOfDensity" , type="eps" )

# B
# mu = 162
# p(height in 147, 177) = 2/3

# in other words: integral between 147 and 177 = 2 / 3, solve for sigma?

# integral[147,177]( 1/(sdval*sqrt(2*pi)) )
# * exp( -.5 * ((x-162)/sdval)^2 )] = 2/3

# how to do it in CODE?

# dumb solution: integral is around 2/3 between +1 and -1 stdev,
# so stdev must be 15 to create that