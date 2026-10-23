# Poor Social Learning is a Premorbid Marker of Schizophrenia

*This report is the final project for the Bayesian Statistical Modeling course at Brandeis, taught by Dr. Xiaodong Liu (Professor of Psychology).*

1. Abstract
    The aim of this report is to quantify how people with schizophrenia adjust strategy after self-caused social conflict in a game-theory task, and to treat the social adjustment patterns as a premorbid candidate cognitive endophenotype for schizophrenia.

2. Methods
    Bayesian Statistical Modeling
        1. **Define Priors**: 
            - *Learning Level*: What is the probability of the individual successfully changing strategy with the aim of repairing a social conflict?
            - *Conflict Sensitivity*: What is the probability that modifying strategy will cause inner conflict for the individual?
            - *Reality Divergence Rate*: What is the probability that the individual changes his/her understanding of the game's purpose/definition instead of learning?   
        1. **Run simulation (Data)**:
            - Simulation runs: Agents play $N$ rounds of Hawk-Dove. Data is logged into the table above.
            - Bayesian Inference runs: Take logged table, pass it into PyMC, and use MCMC sampling.
            - Posterior Check: The model indicates, for example: "Given the choices they made after triggering clashes, there is a 95% probability that this participant's learning rate $\alpha$ lies between $0.15$ and $0.25$."
        1. **Define likelihood**:
        1. **Posterior**:
        1. **Inference**:
        
3. Results
4. Discussion
    Elaborate on the data generated from game-theory program:
    **Conflict trial**: *binary indicator that the participant’s proposal was rejected/penalized.*
    **Strategy adjustment**: *binary or categorical (did they change offer type, fairness level, or tactic on the next trial?).*
    **Speed of adjustment**: *number of trials until a successful repair, or reaction time / decision latency on the repair trial.*
    **Type of self-preservation**: *categorical code if they avoid repair, escalate, withdraw, or use a different protective tactic.*

5. Conclusion
    *Based on the data*:
        - *After a self-caused conflict, how quickly and how often does the individual shift strategy to repair the interaction?*
        - *Do people with schizophrenia and intellectual disability show slower, less flexible, or more self-protective (rather than interaction-repairing) adjustments compared with control groups?*
        - *Can we extract a quantifiable summary of this flexibility that could serve as an endophenotype?*





