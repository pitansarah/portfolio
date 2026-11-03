# Overview: Poor Social Learning is a Premorbid Marker of Schizophrenia

*This report is the final project for the Bayesian Statistical Modeling course at Brandeis, taught by Dr. Xiaodong Liu (Professor of Psychology).*

1. Abstract
Impaired social adaptation represents a core cognitive and behavioral feature of schizophrenia, yet dynamic behavioral flexibility during interpersonal conflict remains difficult to quantify using traditional metrics. This study introduces a computational framework combining evolutionary game theory with Bayesian modeling to investigate post-social conflict strategy as a premorbid marker of schizophrenia. Modeling binary choice updates ($\text{Switch}_{i,t}$) via a Bernoulli likelihood with a logit link function, the estimate population-level group differences ($\beta_{\text{group}}$) and individual-level learning rates ($\alpha_i$) using PyMC and NUTS sampling. Model reliability is established through MCMC convergence diagnostics and Posterior Predictive Checks. Results demonstrate...

2. Introduction

3. Methods
[Read the full Methods Documentation](psych-evals/reports/social-learning-schizophrenia/methods.md)
        
4. Results

5. Discussion
To evaluate how agents respond to ritualized social conflict, four metrics are logged:
    **Conflict trial** (C_trial): *binary indicator that the participant’s proposal was rejected/penalized.*
    **Strategy adjustment**(S_adj): *binary or categorical (did they change offer type, fairness level, or tactic on the next trial?).*
    **Speed of adjustment**(T_repair): *number of trials until a successful repair, or reaction time / decision latency on the repair trial.*
    **Type of self-preservation**(P_type): *categorical code if they avoid repair, escalate, withdraw, or use a different protective tactic.*

6. Conclusion
    *Based on the data*:
        - *After a self-caused conflict, how quickly and how often does the individual shift strategy to repair the interaction?*
        - *Do people with schizophrenia and intellectual disability show slower, less flexible, or more self-protective (rather than interaction-repairing) adjustments compared with control groups?*
        - *Can we extract a quantifiable summary of this flexibility that could serve as an endophenotype?*





