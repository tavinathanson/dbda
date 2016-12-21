# A: goernment minted coin, 9/10 heads

prior = c(100,100)
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(rep(1,9),0),
                     showHDI=TRUE,
                     showCentTend="Mean")

# now predidct prob of heads for the next flip?
show(posterior)

# if the coin is fair, prob is 0.5
# here, bias is 0.452 to 0.586, 
# so that's my predicted prob of heads

# WRONG
# answer is: mean of the probability
# = 0.519

# because the answer we're looking for is
# basically the expected value of the probability
# given all the possible probabilities and their weights?

# B. now we have an expected bias; let's go with 
# a prior of c(0.01, 0.01)

prior = c(1,1) / 100
posterior = BernBeta(priorBetaAB=prior,
                     Data=c(rep(1,9),0),
                     showHDI=TRUE,
                     showCentTend="Mean")
show(posterior)

# mean = 0.899
