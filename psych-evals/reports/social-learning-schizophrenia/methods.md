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
Methods:
1. **Define Priors**: 

<div style="border: 1px solid #0969DA; padding: 10 px; border-radius: 8px; background-color: #89CFF0;">
  <ul>
    <strong>: Deliverable</strong>: A written mathematical specification block mapping priors to PyMC random variables.
  </ul>
</div>
<br>

- *Learning Level*: What is the probability of the individual successfully changing strategy with the aim of repairing a social conflict? *(Assigned via weakly informative hierarchical Beta or Normal priors on log-odds scales, e.g., $\alpha \sim \text{Beta}(2, 5)$).*
- *Conflict Sensitivity*: What is the probability that modifying strategy will cause inner conflict for the individual? *(Modeled via latent individual-level threshold or penalty parameters).*
- *Reality Divergence Rate*: What is the probability that the individual changes his/her understanding of the game's purpose/definition instead of learning? *(Modeled as an alternative behavioral shift probability parameter).*
 
2. **Run game-theory simulation (Data)**:

<div style="border: 1px solid #0969DA; padding: 10px; border-radius: 8px; background-color: #89CFF0;">
  <ul>
    <strong> Action</strong>: Write a simple Python script simulating two distinct agent groups (Control vs. Clinical proxy) playing $N$ rounds of Hawk-Dove with payoff parameters $C > V$. Incorporate a conditional shift rule triggered when an agent experiences a mutual Hawk-Hawk clash.<br>
    <strong>Deliverable</strong>: A Python script (`src/simulation.py`) that generates a clean pandas DataFrame (`agent_id`, `round`, `group`, `choice`, `payoff`, `conflict_prev`, `switched`) stored in `data/simulated_agents.csv`.
  </ul>
</div>
<br>

- *Simulation runs*: Agents play $N$ rounds of Hawk-Dove. Data is logged into the table above.
- *Bayesian Inference runs*: Take logged table, pass it into PyMC, and use MCMC sampling.
- *Posterior Check*: The model indicates, for example: "Given the choices they made after triggering clashes, there is a 95% probability that this participant's learning rate $\alpha$ lies between $0.15$ and $0.25$."
    
3. **Define likelihood**:

<div style="border: 1px solid #0969DA; padding: 10px; border-radius: 8px; background-color: #89CFF0;">
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

<div style="border: 1px solid #0969DA; padding: 10 px; border-radius: 8px; background-color: #89CFF0;">
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

<div style="border: 1px solid #0969DA; padding: 10 px; border-radius: 8px; background-color: #89CFF0;">
  <ul>
    <strong> Action</strong> Execute **Posterior Predictive Checks (PPC)** using `pm.sample_posterior_predictive` to generate simulated choice data from the posterior parameters and compare them against observed choices.
    <br>
    <strong> Deliverable</strong>: A PPC validation graph and a summary table interpreting group-level differences in adjustment speed, quantifying behavioral flexibility as a potential endophenotype.
Run `pm.sample_posterior_predictive` using the fitted trace object to simulate choice data across all agents and trials.</ul>
</div>
<br>

- Build a validation graph (`az.plot_ppc`) comparing the model's simulated choice distributions against the actual observed binary choices in the dataset.
- Calculate posterior contrasts for $\beta_{\text{group}}$ and $\alpha_i$ to assess group-level divergence in adjustment speed, summarizing findings as a potential endophenotype marker.