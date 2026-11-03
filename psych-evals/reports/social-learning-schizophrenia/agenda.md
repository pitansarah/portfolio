## Project Execution & Milestone Schedule (Target Completion: Dec 1, 2026)

### Phase 1: Source Review & Literature Foundations (Nov 3 – Nov 5) [3 Days]
* **Nov 3**: Review Dr. BingKan Xue / University of Florida Hawk-Dove materials; document $C > V$ payoff matrix dynamics ($V = 2$, $C = 6$) and mutual Hawk-Hawk clash triggers ($\text{Conflict}_{i, t-1} = 1$).
* **Nov 4**: Analyze Diaconescu et al. (*PLOS Computational Biology*); extract key takeaways on hierarchical Bayesian updating and social adjustment deficits in clinical populations.
* **Nov 5**: Synthesize notes into background references and draft the formal project abstract.

### Phase 2: Hawk-Dove Agent Simulation & PyMC Model Setup (Nov 6 – Nov 15) [10 Days]
* **Nov 6–8**: Formulate agent behavior rules in `src/simulation.py`. Program two groups (Control vs. Clinical Proxy) playing $N$ rounds of the Hawk-Dove matrix. Set up the dynamic strategy-switching rule triggered exclusively after mutual escalation ($\text{Hawk}_i \text{ vs. Hawk}_j \rightarrow \text{Conflict}_{i, t-1} = 1$), where control agents switch strategies to repair social friction while clinical proxy agents exhibit a lower baseline switching rate ($\alpha_i$).
* **Nov 9–11**: Run simulations to generate agent choice histories. Format and export the output into `data/simulated_agents.csv` containing columns: `agent_id`, `round`, `group`, `choice` (0=Dove, 1=Hawk), `payoff`, `conflict_prev` (lagged conflict state), and `switched` (binary decision update $\text{Switch}_{i,t}$).
* **Nov 12–14**: Formulate hyperpriors ($\beta_0, \beta_{\text{group}}$) and individual priors ($\alpha_i$). Construct `src/model.py` incorporating the logit link equation:
  $$\text{logit}(p_{i,t}) = \beta_0 + \beta_{\text{group}}(\text{Group}_i) + \alpha_i(\text{Conflict}_{i, t-1})$$
  Connect linear predictor to a `pm.Bernoulli` likelihood statement.
* **Nov 15**: Audit simulation dataset shapes, tensor alignment, and execute test-compilation of the PyMC model context to verify zero initialization errors.

### Phase 3: MCMC Sampling, Diagnostics & PPC (Nov 16 – Nov 20) [5 Days]
* **Nov 16–17**: Execute MCMC sampling via PyMC’s NUTS engine (`pm.sample(draws=1000, tune=1000, target_accept=0.95)`). Extract ArviZ metrics (`az.summary`), verify $\hat{R} \le 1.05$ and effective sample sizes, and compile traceplots (`az.plot_trace`). Perform parameter recovery checks against simulation ground truth.
* **Nov 18–19**: Execute `pm.sample_posterior_predictive` for Posterior Predictive Checks, compile `az.plot_ppc` validation figures, and calculate posterior contrasts for $\beta_{\text{group}}$.
* **Nov 20**: Consolidate posterior parameter summary tables (mean, SD, 95% HDIs).

### Phase 4: Marp Markdown Slide Deck Development (Nov 21 – Nov 25) [5 Days]
* **Nov 21–22**: Draft Slides 1–6 (Clinical Motivation, Hawk-Dove Payoff Matrix & $C > V$ Escalation Dynamics, Agent Simulation Setup, and Likelihood Specification).
* **Nov 23–24**: Draft Slides 7–12 (Posterior Parameter Distributions, MCMC Diagnostics, PPCs, and Conclusion on post-conflict strategy adjustment as an endophenotype).
* **Nov 25**: Verify preview layout in VS Code / Codespaces (inspect list numbering, HTML container rendering, and LaTeX bounds).

### Phase 5: Final Review, Compilation & Export (Nov 26 – Dec 1) [6 Days]
* **Nov 26–28**: Run complete presentation dry-runs and refine slide speaker notes.
* **Nov 29–30**: Compile final `.md` presentation deck to `.pptx` / `.pdf` via Marp CLI / extension.
* **Dec 1**: Final repository commit and assignment submission.