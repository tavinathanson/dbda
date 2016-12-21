# poll: 58 preferred A over B in 100 people; 42 the other
# A. prior was uniform; 95% HDI on beliefs after learning poll?
# prior is beta(theta|1,1)
# posterior is beta(theta|59, 43)

# should just be beta(theta|5,4) right?
source("BernBeta.R")
prior = c(1, 1)
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(rep(1, 58), rep(0, 42)),
                     showHDI=TRUE)
show(posterior)
# HDI is 0.483 to 0.673 from BernBeta

# follow-up poll: 57/100
posterior = BernBeta(priorBetaAB=posterior,
                     Data=c(rep(1, 57), rep(0, 43)),
                     showHDI=TRUE)
show(posterior)
# HDI is now 0.506 to 0.642