# Description

# This coursework excerpts for Psy123a "Bayesian Statistical Modeling" (Professor: Dr. Liu, Brandeis University) demonstrates simulation. Template given by the Professor.

# Note: All R script was developed and tested in RStudio.

# Objective: 
# Estimate participants' average reaction time based on 5 observations, using a quartic likelihood model, Normal prior, and 95% quartic credibel interval.

# clear working space
rm(list = ls())

# dependencies
source("dependencies-simulation-02.R")

# known information
# parameter bandwidth
h <- 150
# observed data: reaction time for five participants
y.vec <- c(417, 486, 477, 437, 375)

# the prior distribution mu ~ N(450, 50^2)
# the data model (likelihood function): Biweight (Quartic) distribution

# Define a grid of 1000 possible mu values (the parameter to be estimated)
# use the data boundaries given the observed data.
lower <- max(y.vec) - h - 10
upper <- min(y.vec) + h + 10
sim.grid <- data.frame(mu.val = seq(from = lower, to = upper, length = 1000))

# Evaluate the density of each mu (in the mu.val grid) given the prior and the likelihood of each mu given the data and data model
sim.grid <- within(sim.grid, {
  prior <- dnorm(mu.val, mean = 450, sd = 50)
  likelihood <- sapply(mu.val, biweight_likelihood, t = y.vec, h = 150)
})

# Approximate the posterior pmf
sim.grid <- sim.grid %>%
  mutate(unnormalized = prior * likelihood,
         posterior = unnormalized / sum(unnormalized))

# verify posterior is a probability function
# the following line of codes should return value 1
with(sim.grid, sum(posterior))

# calculate/plot posterior using dense grid approx method
ggplot(sim.grid, aes(x = mu.val, y = posterior)) +
  geom_line() +
  labs(title = "Grid approx posterior distribution")

# visualize the prior, the likelihood, and the posterior pmf
ggplot(sim.grid, aes(x = mu.val, y = prior)) +
  geom_line() +
  labs(title = "Prior Distribution of mu",
       x = expression(mu),
       y = "Prior Density")

# write YOUR CODES below to show the likelihood function of mu
ggplot(sim.grid, aes(x = mu.val, y = likelihood)) +
  geom_line() +
  labs(title = "Likelihood Distribution of mu",
       x = expression(mu),
       y = "Likelihood")

# write YOUR CODES below to show the posterior pmf of mu
ggplot(sim.grid, aes(x = mu.val, y = posterior)) +
  geom_line() +
  labs(title = "Posterior Distribution of mu",
       x = expression(mu),
       y = "Posterior Density")

# sample from the discretized posterior (pmf)
# Set the seed
set.seed(123)
post.sample <- slice_sample(sim.grid, n = 5000,
                             replace = TRUE,
                             weight_by = posterior)

## show  distribution graphically
ggplot(post.sample, aes(x = mu.val)) +
  geom_histogram(aes(y = after_stat(density)), bins = 100, color = "black") +
  geom_density(color = "blue", size = 2) +
  labs(title = "Simulated posterior pdf",
       x = bquote(mu), y = bquote("f(" ~ mu ~ "|y)"))

post_mean <- mean(post.sample$mu.val)
post_median <- median(post.sample$mu.val)
post_mode <- sim.grid$mu.val[which.max(sim.grid$posterior)]

# middle 95% credible interval: 2.5% and 97.5% quantiles of the draws
cred_95 <- quantile(post.sample$mu.val, c(0.025, 0.975))
cat("Based on the simulated posterior pdf, the estimated mean of the posterior mu is", round(post_mean, 2), ".\n")
cat("Based on the simulated posterior pdf, the estimated mode of the posterior mu is", round(post_mode, 2), ".\n")
cat("Based on the simulated posterior pdf, the estimated median of the posterior mu is", round(post_median, 2), ".\n")
cat("Based on the simulated posterior pdf, the middle 95% credible interval of the posterior mu is", round(cred_95, 2), ".\n")