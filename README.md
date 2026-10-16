
*Portfolio structure overview.*

# Intelligence Analysis

Contains briefs, reports, and projects that collect, analyze, and interpret data with the end goal of evaluating human behaviors and risk. 

## Projects
Long-form works that model and analyze data to produce findings that answer a key question.

> Project ORBIT (Online Risk & Behavioral Indicator Tracking)
Surveil and assess social media activity to identify social networks and disinformation contrary to U.S. interests.
> Project SHADOW (Strategic Human Analysis & Data OPSEC for Workforce)
Evaluate personal operation risks to protect target individuals from adversarial intelligence exploitation.
> Project SUGAR (Strategic Utility & Governance for Adult Relationships)
Set decision criteria for consensual transactional adult-relationships, with an emphasis on risk mitigation. Uses a marketplace framework.

## Reports
Evaluations of evidence surrounding a central problem, emphasizing uncertainty and analytical conclusions.

> 2016 U.S. presidential election Russian influence operation
[Background: Grokipedia](https://grokipedia.com/page/Russian_interference_in_the_2016_United_States_elections)
> 2016–2017 Havana, Cuba U.S. Embassy incidents (Anomalous Health Incidents)
[Background: Grokipedia](https://grokipedia.com/page/Havana_syndrome)
> 2021 January 6 U.S. Capitol Breach 
[Background: Grokipedia](https://grokipedia.com/page/January_6_United_States_Capitol_attack)
> 2024 Salt Typhoon
[Background: Grokipedia](https://grokipedia.com/page/Salt_Typhoon)


# Psychological Evaluations
Reports that analyze publicly documented behaviors of individuals with abnormal psychologies to infer mental state.

## Reports
> Bryan Kohberger / University of Idaho Murders  
[Background: Wikipedia](https://en.wikipedia.org/wiki/2022_Idaho_student_murders)  
> Rex Heuermann / Gilgo Beach Murders  
[Background: Grokipedia](https://grokipedia.com/page/Rex_Heuermann)  
> Nidal Hasan / Fort Hood Shootings
[Background: Grokipedia](https://grokipedia.com/page/Nidal_Hasan)

# Quantitative Analysis
Contains coursework excerpts demonstrating statistical modeling. Written in Python and R. 

## Bayesian-Modeling (R)

### Grid Approximation
A dense grid of candidate μ values is scored by prior times likelihood and normalized into a discrete posterior, which is then plotted and sampled without an analytic normalizing constant.
**TODO:**
*As of 16:50, Fri, 10/09/26.*
- Create `grid-approx-01.R`.
- Create `dependencies-simulation-01.R`.
- Create `inference-01.R`.
- Create `dependencies-inference-01.R`.

### Inference
Statistical estimation from data and a probability model, including how that estimate changes as evidence is added.

### Sequential Updating
The posterior from one batch of reaction times becomes the prior for the next batch, so the estimate of μ is revised as new observations arrive instead of being refit from scratch.
> Sequential Update 1: Texting Rates
Sequential Bayesian updating of the hourly text-message rate, one participant at a time. Order changes the path of the estimate, not the final posterior.

### Simulations
Programs using mathematical models and mass random sampling to recreate possible outcomes when there is limited data on the target event.
> Simulation 1: Resisting Compulsions
Compares the prior beliefs of two researchers estimating the probability of participants resisting compulsions. Uses data evidence to quantify posterior probability. 
> Simulation 2: Reaction Times
Estimates the popualation mean reaction time by gridding a normal prior against a bounded biweight likelihood fro five observed reaction times, then plots the posterior and summarizes it with draws.

## Python

### Exercises
Brief python programs accomplishing simple tasks to demonstrate problem-solving and technical skill.

### Projects
> Crime Tracker 
Uses publically available data to summarize crime trends.
> Relationship Mapping Tool
Maps connections between target individuals by profession and documented connection to key current events. *Related: Project SHADOW.*
> Texting Risk Assessment Calculator 
Evaluates text communication data to identify risk indicators and optimize text response. 


# AI Use
Grok/Grokipedia were used to for debugging, automation, and preliminary research. ChatGPT and Gemini were used for conversational brainstorming and writing edits/revision.


