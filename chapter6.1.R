# A. start with beta(theta|4,4); flip coin once and get heads
# what is posterior?
# should just be beta(theta|5,4) right?
source("BernBeta.R")
prior = c(4, 4)
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(1))
show(posterior)

# B. again get a head
# should be 6/4
posterior = BernBeta(priorBetaAB=posterior,
                     Data=c(1))
show(posterior)

# C. get a tail
posterior = BernBeta(priorBetaAB=posterior,
                     Data=c(0))
show(posterior)

# D repeat with T/H/H
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(0,1,1))
show(posterior)
# same as before