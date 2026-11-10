## Project Execution & Milestone Schedule (Target Completion: Dec 1, 2026)

### Phase 1: Source Review & Literature Foundations (Nov 3 – Nov 8)
* [*Complete*] Review Dr. BingKan Xue / University of Florida Hawk-Dove materials; take notes on game code.
* <div style="border: 1px solid black; padding: 10px;">[*Incomplete*] Formulate Bayesian priors for: 
    - Learning Level
    - Conflict Sensitivity
    - Reality Divergence Rate </div><br>
* <div style="border: 1px solid black; padding: 10px;"> Revise methods ('analytical plan') according to template file: `Psy123a_FinalProject_template_F2026.rmd`.</div><br>
* <div style="border: 1px solid black; padding: 10px;"> Update agenda according to file: "Psy123a final project instructions."</div> 

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

### Phase 4: Create Slides with Powerpoint (Nov 21 – Nov 25)
* **Nov 21**: Make Powerpoint Outline according to template (see `Psy123a_finalPresentation_template_F2026.Rmd`).
* **Nov 22–24**: Draft Slides 1–6 (Clinical Motivation, Hawk-Dove Payoff Matrix & $C > V$ Escalation Dynamics, Agent Simulation Setup, and Likelihood Specification).
* **Nov 24–25**: Draft Slides 7–12 (Posterior Parameter Distributions, MCMC Diagnostics, PPCs, and Conclusion on post-conflict strategy adjustment as an endophenotype).


### Phase 5: Final Review, Compilation & Export (Nov 26 – Dec 1) 
* **Nov 26–28**: Run complete presentation dry-runs and refine slide speaker notes.
* <span style="color:red"> **Nov 27**: Presentation draft submission DUE.</span> 
* **Nov 29–30**: Compile final `.md` presentation deck to `.pptx` / `.pdf` via Marp CLI / extension.
* <span style="color:red"> **Dec 1**: In-class final presentation.</span>