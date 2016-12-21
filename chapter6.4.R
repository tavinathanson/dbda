# weird prior: coin is strongly biased either towards
# heads or tails; express as beta prior
# a,b = 0.1,0.1?

prior = c(0.1,0.1)

# now get 5 flips, heads 4/5 times
posterior = BernBeta(priorBetaAB=prior,
                           Data=c(1,1,1,1,0),
                           showHDI=TRUE,
                      showCentTend=TRUE)
# HDI 0.464 to 1
# weird that it still overlaps 0.5?

# WRONG: need stronger prior, before was equivalent to 1/n=10?
prior = c(0.01,0.01)

# now get 5 flips, heads 4/5 times
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(1,1,1,1,0),
                     showHDI=TRUE,
                     showCentTend=TRUE)

# HDI is still starting at 0.472, but mode at 1.0 clearly