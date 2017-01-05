data {
  int<lower=0> N; // Number of tosses
  int y[N]; // Value of each toss
}
parameters {
  real<lower=0,upper=1> theta;
}
model {
  theta ~ beta(400, 400); // Prior on bias is uniform
  y ~ bernoulli(theta); // Each toss is 
}