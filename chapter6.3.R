# test 1: show "radio", get F and J responses
#  40 F / 50
# test 2: show "ocean mountain", get F and J responses
#  15 F / 50

# is there a bias betwen test 1 and 2?

prior = c(1, 1)
posterior_test1 = BernBeta(priorBetaAB=prior,
                     Data=c(rep(1, 40), rep(0, 10)),
                     showHDI=TRUE)

posterior_test2 = BernBeta(priorBetaAB=prior,
                           Data=c(rep(1, 15), rep(0, 35)),
                           showHDI=TRUE)

# 95% HDI doesn't overlap...
# WRONG
# Misunderstood question

# Answer: both HDIs don't overlap 0.5, so they're both biased