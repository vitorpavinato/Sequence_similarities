## Code to illustrate the behaviour of the extreme value distribution
## given different data base size (subject size) and lambda

library(fitdistrplus); 
library(ggplot2);
library(VGAM)
library(evd)

ext.value.dist <- function(x)
{
  K = 10
  M = 100
  N = 1000000
  lambda = 5
  
  y = K*M*N * exp((-lambda*x))
  1 - exp(-y)
  
  return(1 - exp(-y))
}
ext.value.dist(10)

x <- seq(-10, 20)
p <- ext.value.dist(x)
plot(p~x, type="l")





