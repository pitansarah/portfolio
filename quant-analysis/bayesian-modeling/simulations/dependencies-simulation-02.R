# Dependencies Simulation-02

# Helper Function
# the Biweight Likelihood Function based on the data model
# where t: reaction time (i.e. y value);
# mu: parameter mu; h: bandwidth
biweight_likelihood <- function(t, mu, h) {

  # compute the scaled reaction time
  u <- (t - mu) / h

  ## Check if any data points fall outside the valid boundary (|u| > 1)

  if (any(abs(u) > 1)) {
    return(0)   ##if the data value outside the boundary, likelihood is zero
  }

  # Calculate individual density  (Biweight PDF)
  pdf_values <- (15 / (16 * h)) * (1 - u^2)^2
  ## Return the joint likelihood (the product of all individual density)
  return(exp(sum(log(pdf_values))))
}

# install packages 
install.packages(c(
    'tidyverse',
    'bayesrules',
    'dplyr',
    'janitor',
    'knitr',
    'patchwork',
))

# load packages
library('tidyverse')
library('bayesrules')
library('dplyr')
library('janitor')
library('knitr')
library('patchwork')
