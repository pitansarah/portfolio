
# Description

# These homework excerpts for Psy123a "Bayesian Statistical Modeling" 
# (Professor: Dr. Liu, Brandeis University) demonstrates simulation. 
# Simulation generates large amounts of synthetic data which help an analyst
# understand uncertainty in the estimated probability of a target event. 

# Transferable skills: estimate probability of event occurence using incomplete starting data.

# clear working space
rm(list = ls())

# loading packages
library(bayesrules)
library(dplyr)
library(janitor)
library(ggplot2)
library(knitr)

# Simulation 1: 
# Simulate the posterior and estimate its mean, SD, and middle 95% values of theta.

#Calculate alpha.posterior and beta.posterior 

alpha.prior.ciara <- 3
beta.prior.ciara <- 10

alpha.prior.taylor <- 2
beta.prior.taylor <-0.1

y <- 3
n <- 7

alpha.post.ciara <- alpha.prior.ciara + y
beta.post.ciara <- beta.prior.ciara + (n - y)

alpha.post.taylor <- alpha.prior.taylor + y
beta.post.taylor <- beta.prior.taylor + (n - y)

cat("The calculated alpha and beta values for Ciara's posterior distribution model are, alpha:", alpha.post.ciara, "and beta:", beta.post.ciara, ".")

cat("The calculated alpha and beta values for Taylor's posterior distribution model are, alpha:", alpha.post.taylor, "and beta:", beta.post.taylor, ".\n")

# Simulation based off Ciara's Prior Beta(3, 10)

set.seed(84735)

sim.theta.ciara <- data.frame(
  theta = rbeta(
    n = 10000,
    shape1 = alpha.prior.ciara,
    shape2 = beta.prior.ciara
  )
)

sim.theta.ciara$Y <- rbinom(
  n = 10000,
  size = 7,
  prob = sim.theta.ciara$theta
)

posterior.theta.ciara <- sim.theta.ciara %>%
  filter(Y == 3)

ggplot(data = posterior.theta.ciara, aes(x = theta)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30) +
  labs(
    title = "Ciara's Simulated Posterior of theta Given Y = 3",
    x = "theta",
    y = "Posterior density"
  )

# Simulation based off Taylor's Prior Beta(2, 0.1)

sim.theta.taylor <- data.frame(
  theta = rbeta(
    n = 10000,
    shape1 = alpha.prior.taylor,
    shape2 = beta.prior.taylor
  )
)

sim.theta.taylor$Y <- rbinom(
  n = 10000,
  size = 7,
  prob = sim.theta.taylor$theta
)

posterior.theta.taylor <- sim.theta.taylor %>%
  filter(Y == 3)

ggplot(data = posterior.theta.taylor, aes(x = theta)) +
  geom_histogram(aes(y = after_stat(density)), bins = 30) +
  labs(
    title = "Taylor's Simulated Posterior of theta Given Y = 3",
    x = "theta",
    y = "Posterior density"
  )

#posterior mean, sd, and boundaries of the middle 95% values of theta
  
  #Ciara's simulated posterior
  
  ciara_summary <- posterior.theta.ciara %>%
    summarize(
      posterior_mean = mean(theta),
      posterior_sd = sd(theta),
      lower_95 = quantile(theta, 0.025),
      upper_95 = quantile(theta, 0.975)
    ) 
    
  knitr::kable(ciara_summary, caption = "Ciara's Posterior Summary")
  
cat("The mean for Ciara's posterior distribution is", (ciara_summary$posterior_mean), ". The standard deviation for Ciara's posterior distribution is", (ciara_summary$posterior_sd), ". The lower boundary for the middle 95% values of theta is", (ciara_summary$lower_95), " and the upper boundary for the middle 95% values of theta is", (ciara_summary$upper_95), ".")

  #Taylor's simulated posterior
  
  taylor_summary <- posterior.theta.taylor %>%
    summarize(
      posterior_mean = mean(theta),
      posterior_sd = sd(theta),
      lower_95 = quantile(theta, 0.025),
      upper_95 = quantile(theta, 0.975)
    )
    
  knitr::kable(taylor_summary, caption = "Taylor's Posterior Summary")
 
cat("The mean for Taylor's posterior distribution is", (taylor_summary$posterior_mean), ". The standard deviation for Ciara's posterior distribution is", (taylor_summary$posterior_sd), ". The lower boundary for the middle 95% values of theta is", (taylor_summary$lower_95), " and the upper boundary for the middle 95% values of theta is", (taylor_summary$upper_95), ".")


