# Methods: Poor Social Learning is a Premorbid Marker of Schizophrenia 

This document outlines the methodological approaches, analytical frameworks, and technical procedures used throughout this project. It provides an overview of the processes used to collect, organize, analyze, and interpret data.

## Presentation: 
1. Sources: 
    - "The Hawk Dove Game" 
    [Source: Dr. BingKan Xue / University of Florida](https://cmp.phys.ufl.edu/PHZ4710/index.html)
    - *Aberrant computational mechanisms of social learning and decision-making in schizophrenia and borderline personality disorder* 
    [Source: Henco, et.al / PLOS Journal](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008162)
    <br>   
1. Make Presentation (Marp) 
    **OUTLINE**:
    1. Introduction: 
    - *Clinical context*: Impaired social adaptation as an early-stage cognitive marker.
    - *Research gap*: Quantifying dynamic behavioral flexibility during interpersonal conflict.

    2. Framework: *Hawk-Dove Game*
    - Modeling social interactions using evolutionary game theory.
    - Payoff structure: Cost ($C$) versus Value ($V$), where $C > V$.
    - Behavioral trigger: Mutual Hawk-Hawk clashes ($\text{Conflict}_{i, t-1} = 1$) forcing strategy adjustment.

    3. Simulation: *Hawk-Dove Game*

    4. Bayesian Model:
    - *Priors*
    - *Likelihood*
    - *MCMC Sampling*

    5. Results:
    - *Posterior Plot & Summary*
    - *Predictive Checks*
    - *MCMC Convergence & Diagnostic Summary*: R-hat, ESS, traceplots
    - *HDI*

    6. Conclusion:
    - Interpretation of Results
    - **Does the Bayesian model provide sufficient quantitative evidence to validate impaired post-conflict strategy adjustment as an endophenotype for schizophrenia?**


## Project: 
*All code unless otherwise specified is to be written in R.*
Methods:
**Define Priors**: 

<div style="border: 1px solid #0969DA; padding: 10px; border-radius: 0; background-color: #89CFF0;">
  <strong>Deliverable</strong>: An R code block with Bayesian prior specifications involving simulation variables.
</div>
<br>

**Prior 1**: *Learning Level*: What is the probability of the individual successfully changing strategy with the aim of repairing a social conflict? 
<center>$\alpha \sim \text{Beta}(2, 5)$</center>
<br>
<small>Reasoning: Beta models are used when a variable,  like learning level, represents a number in between 0 and 1. Here, 1 represents immediate strategy adaptation and 0 represents complete learning rigidity, the estimated prior mean for learning levels during social conflict is 0.28 (calculated as $\frac{\alpha}{\alpha + \beta\\}$). $\alpha = 2$ represents the shape parameter for successes, and $\beta = 5$ represents the shape parameter for failures. Success represents a strategy change that repairs the conflict (resulting in a win), while failure represents an agent sticking with their current strategy. Because $\beta$ is greater than $\alpha$, the prior distribution is right-skewed. This reflects the psychological tendency for healthy individuals to overcome cognitive friction in order to resolve social conflict, which requires less frequent and more conditional adaptation. </small>
</div>
<br>
<br>

**Prior 2**: *Conflict Sensitivity*: What is the probability that modifying strategy will cause inner conflict for the individual? *(Modeled via latent individual-level threshold or penalty parameters).*

<center>$$\begin{aligned} \text{\textbf{Hyperparameters}} &\quad (\text{Group-level distributions}) \\ \mu_\tau &\sim \text{Normal}(0, 1) \\ \sigma_\tau &\sim \text{HalfNormal}(0.5) \\ \text{\textbf{Level-1 Priors}} &\quad (\text{Individual-level parameters for agent } i) \\ \alpha_i &\sim \text{Beta}(2, 5) \\ \tau_i &\sim \text{Normal}(\mu_\tau, \sigma_\tau^2) \end{aligned}$$</center>

<small>Reasoning: The normal distribution is chosen here because it allows for slight variation of individuals within a general population trend of conflict sensitivity. The hyperparameters (which define the groups' average behavior and spread reasonably according to human psychology) are $\mu_\tau$ and $\sigma_\tau$. $\mu_\tau$ represents conflict sensitivity levels of the human population, on average. The model $\mu_\tau \sim \text{Normal}(0, 1)$ says 'On average, it's expected that most humans operate rationally and experience very low conflict sensitivity. $\sigma_\tau$ represents the group variation of conflict sensitivity within the population. $\sigma_\tau \sim \text{HalfNormal}(0.5)$ means: 'There may be variance from one individual to another, but these differences are reasonable (bounded).' The prior definition $\tau_i \sim \text{Normal}(\mu_\tau, \sigma_\tau^2)$ frames the parameter of conflict sensitivity by sampling from the hyperparameters. </small>

**Prior 3:** *Reality Divergence Rate*: What is the probability that the individual changes his/her understanding of the game's purpose/definition instead of learning? *(Modeled as an alternative behavioral shift probability parameter).*

<center> </center>
 
2. **Run game-theory simulation Using Python(Data)**:

<div style="border: 1px solid #0969DA; padding: 10px; border-radius: 0; background-color: #89CFF0;">
  <ul>
    <strong> Deliverable</strong>: Write a Python script simulating two distinct agent groups (Control vs. Clinical proxy) playing $N$ rounds of Hawk-Dove with payoff parameters $C > V$. Incorporate dynamic drivers based on player's mood, opponent history, etc. The drivers may use Bayesian updating.
  </ul>
</div>
<br>

    
3. **Define likelihood**:

<div style="border: 1px solid #0969DA; padding: 10px; border-radius: 0; background-color: #89CFF0;">
  <ul>
     <strong> Action</strong>: Translate the behavioral transition rules into a formal statistical observation model. Model the binary outcome of strategy adjustment ($\text{Switch}_{i,t}$) on trial $t$ using a **Bernoulli likelihood** with a logit link function:
     <div style = 'overflow-x: auto; max-width: 100%; padding; 4px 0; margin: 4px 0;'>
        $$\text{logit}(p_{i,t}) = \beta_0 + \beta_{\text{group}}(\text{Group}_i) + \alpha_i(\text{Conflict}_{i, t-1})$$
       <p> where $\beta_{\text{group}}$ captures the group-level difference in flexibility and $\alpha_i$ represents individual-level learning variation.</p>
        </div>
     <strong> Action</strong>: **Deliverable**: A compiled PyMC model block (`src/model.py`) that initializes the likelihood function and runs without shape mismatch or syntax errors.
     </ul>
</div>
<br>   

- Initialize the PyMC model block (`pm.Model()`) and define conservative hyperpriors and priors for population-level parameters ($\beta_0$, $\beta_{\text{group}}$) and individual-level learning rates ($\alpha_i$).
- Code the logit link equation ($\text{logit}(p_{i,t}) = \beta_0 + \beta_{\text{group}}(\text{Group}_i) + \alpha_i(\text{Conflict}_{i, t-1})$) using pandas data columns for group indicators and lagged conflict states.
- Link the linear predictor to a `pm.Bernoulli` likelihood statement, pass a small subset of `data/simulated_agents.csv`, and test-compile to ensure zero shape mismatches.
    
4. **Posterior**:

<div style="border: 1px solid #0969DA; padding: 10 px; border-radius: 0; background-color: #89CFF0;">
  <ul>
    <strong>Action</strong>: Sample from the joint posterior distribution using PyMC’s NUTS sampler (`pm.sample(draws=1000, tune=1000, target_accept=0.95)`). Diagnose sampler convergence using standard metrics ($\hat{R} \le 1.05$ and effective sample size). 
    <br>
    <strong> Deliverable</strong>: MCMC traceplots, parameter recovery validation charts, and summary tables of posterior estimates (mean, SD, and 95% Highest Density Intervals).</ul>
</div>
<br>

- Execute `pm.sample(draws=1000, tune=1000, target_accept=0.95)` with appropriate random seeds to draw from the joint posterior distribution.
- Extract convergence metrics via ArviZ (`az.summary`), verifying that $\hat{R} \le 1.05$ and effective sample sizes (ESS) are robust, then generate traceplots (`az.plot_trace`).
- Fit the model against synthetic data generated from known ground-truth simulation values to verify that the posteriors correctly recover the original parameters.
    
5. **Inference**:

<div style="border: 1px solid #0969DA; padding: 10 px; border-radius: 0; background-color: #89CFF0;">
  <ul>
    <strong> Action</strong> Execute **Posterior Predictive Checks (PPC)** using `pm.sample_posterior_predictive` to generate simulated choice data from the posterior parameters and compare them against observed choices.
    <br>
    <strong> Deliverable</strong>: A PPC validation graph and a summary table interpreting group-level differences in adjustment speed, quantifying behavioral flexibility as a potential endophenotype.
Run `pm.sample_posterior_predictive` using the fitted trace object to simulate choice data across all agents and trials.</ul>
</div>
<br>

- Build a validation graph (`az.plot_ppc`) comparing the model's simulated choice distributions against the actual observed binary choices in the dataset.
- Calculate posterior contrasts for $\beta_{\text{group}}$ and $\alpha_i$ to assess group-level divergence in adjustment speed, summarizing findings as a potential endophenotype marker.