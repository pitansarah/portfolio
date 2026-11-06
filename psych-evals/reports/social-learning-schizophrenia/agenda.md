## Project Execution & Milestone Schedule (Target Completion: Dec 1, 2026)

### Phase 1: Source Review & Literature Foundations (Nov 3 – Nov 8)
* [*Complete*] Review Dr. BingKan Xue / University of Florida Hawk-Dove materials; take notes on game code.
* [*Incomplete*] Read Diaconescu et al. (*PLOS Computational Biology*); take notes on takeaways and use them to support/formulate Bayesian priors for: 
    - Learning Level
    - Conflict Sensitivity
    - Reality Divergence Rate
* Synthesize notes into background references and draft the formal project abstract.

### Phase 2: Hawk-Dove Agent Simulation & PyMC Model Setup (Nov 8 – Nov 15) 
* [*Incomplete*] Formulate dynamic agent behavior drivers. Program two groups of two agents (Control vs. Experimental, Hawk vs. Dove) playing $N$ rounds of the Hawk-Dove game. Run simulation. Collect data into a csv doc.

### Phase 3: MCMC Sampling, Diagnostics & PPC (Nov 16 – Nov 20) 
* Execute MCMC sampling:
    - trace plots
    - Bulk ESS, Tail ESS
    - R-hat
    - autocorrelation plots
    - ! (see Psy_123 HW 10-11)
    - diagnostic summary
    - 95% HDI, ETI
* Posterior Predictive Checks

### Phase 4: Marp Markdown Slide Deck Development (Nov 21 – Nov 25) 
* **Nov 21–22**: Draft Slides 1–6 (Clinical Motivation, Hawk-Dove Payoff Matrix & $C > V$ Escalation Dynamics, Agent Simulation Setup, and Likelihood Specification).
* **Nov 23–24**: Draft Slides 7–12 (Posterior Parameter Distributions, MCMC Diagnostics, PPCs, and Conclusion on post-conflict strategy adjustment as an endophenotype).
* **Nov 25**: Verify preview layout in VS Code / Codespaces (inspect list numbering, HTML container rendering, and LaTeX bounds).

### Phase 5: Final Review, Compilation & Export (Nov 26 – Dec 1) 
* **Nov 26–28**: Run complete presentation dry-runs and refine slide speaker notes.
* **Nov 29–30**: Compile final `.md` presentation deck to `.pptx` / `.pdf` via Marp CLI / extension.
* **Dec 1**: Final repository commit and assignment submission.