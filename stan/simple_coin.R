library("rstan")
rstan_options(auto_write = TRUE, 
              verbose = TRUE, 
              cores = 1)

coin_data <- list(N = 11,
                  y = c(1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0))
fit <- stan(file = 'simple_coin.stan', 
            data = coin_data, 
            iter = 100, 
            chains = 3)

plot(fit)
summary(fit)