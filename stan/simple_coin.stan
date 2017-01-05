data {
  int<lower=0> N; // Number of tosses
  int y[N]; // Value of each toss
}
parameters {
  real<lower=0,upper=1> theta;
}
model {
  theta ~ beta(400, 400); // Prior on bias=theta is fairly centered around 0.5
  y ~ bernoulli(theta); // Bias=theta percent of tosses are H
}