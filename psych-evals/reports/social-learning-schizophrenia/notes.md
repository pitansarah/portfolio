
"The Hawk Dove Game" 
[Source: Dr. BingKan Xue / University of Florida](https://cmp.phys.ufl.edu/PHZ4710/files/unit8/hawk-dove.html)

### Intro

- *bet-hedging strategy*: risk-management stratgy in which an entity distributes its investments/outcomes across multiple possibilities to reduce the risk of total failure (opposed to putting all of eggs in a single basket)
    - genes linked to schizophrenia persist despite reduced individual reproductive fitness because these genes also correlate to cognitive traits periodially selected in extreme conditions (e.g.: war, natural catastrophe, social revolution): hyper-vigilance, novel pattern identification, and radical behavioral divergence
    - as a species, humans hedge their bets by producing a diversity of neurotypes, most of which are normative, but a small portion which are high-variance/divergent
- most social conflict is ritualized to avoid damaging/reducing species as a whole; yet what motivates the behaviors of an individual from their perspective may deviate from this standard (conflict ritualization)
    - observer dynamics
    *subjective modeling*: 
    - to a psychotic individual, *the conflict is highly ritualized* and governed by extremely rigid, hyper-systematized logic fueled by delusion, paranoia, belief in symbolic/cosmic order, and exaggerated object relations
    - the rules of the game for this individual do not overlap with the rules of the game in reality, they belong to an internal conflict space within the individual; this explains apparently unprovoked acts of psychotic individual
    - the individual overinterprets social signals (e.g.: a glance, a stance, an ambient background noise) as a threat to be manipulated/"conquered" in a ritualistic fashion

### TWo-Player Symmetric Games

- in a game, each participant choses from a set of actions; each outcome is represented by a **payoff matrix** (for a two-player symmetric game)

- Scenario 1: each individual uses pure strategy (consistent use of one action); population is a mix of different types of individuals applying their own pure strategy


- Scenario 2: mixed strategy--individual chooses actions randomly according to a probability distribution; population is homogenous and all individuals use the eaxct same mixed strategy


- If p_j is the probability that an individual's randomly encountered opponent will choose action j:
    - p_j, scenario 1 = the popultion frequency who play action j
    - p_j, scenario 2 = the probability weight assigned to action j

- implication: whether an opponent is drawn from scenario 1 or 2, *the lottery of opponent actions is identical*; this makes it unnecessary to separate the math for polymorphic populations vs. mixed-strategy populations when calculating expected payoffs, because a player's optimal strategy and expected payoff depend only on $p_j$, not on how the population generates it.

- *two-player symmetric games* remove role-based tactics (e.g.: hawk and dove) because the individual and the opponent are structurally identical, so fitness (survival) only depends on the strategy the rest of the population is playing, or p_j 

### Hawk-Dove Game: Explanation
- *hawk-dove game ...* when injury costs exceed the resource vaue (C > V), this forces... implying:
    - when hawks are rare, they thrive (invade Doves)
    - as Hawkks increase in frequency, the probability of encountering another Hawk rises, making injury costs C dominant
    - once hawks become too common, the expected payoff drops below that being a dove, which allows doves to thrive
    - this is *self-correcting negative fequency-dependent feedback* which forces the system into an internal equilibrium; the higher the injury cost C relative to the resource value V, the fewer Hawks the population can support at equilibrium
- Hawk & Dove represent two different behaviors among same species in a competition
- if players do Hawk and Dove, Hawk wins and takes reward V while Dove leaves with no reward
    - Hawk: V, Dove: 0
- if players do Dove and Dove they each get half of the reward V/2
    - Dove: V/2, Dove: V/2
- if players do Hawk and Hawk, there will be a conflict; each Hawk has a 50% chance of winning reward V, but there will always be a cost C associated with this fight 
    - Hawk: (V-C)/2, Haw: (V-C)/2

### Hawk-Dove game: simulation
- see `hawk-dove-simulation.r`
- in the simulation, C > V because if C < V, the cost of fighting would be lower than the value of the reward and there would be no evolutionary reason to play as a Dove
- because C > V, a Hawk-Hawk fight results in a huge net loss

#### Bayesian belief updating model
- used as a model to accurately reflect human decision making during conflict
- it keeps the following in mind: 
    - *learning driver*: past payoffs, opponent history
        - **self.history_actions** to store past choices
        - **self.alpha** & **self.beta** to track cumulative opponent moves
    - *mood (regret)*: players may second guess themselves/ consider what may happen before their actions
        - **regret = utility_unchosen - utility_chosen**
        - **omega**: regret weight parameter
    - *loss processing*: assymetric; losses affect mood more negatively than wins affect positively
        - negative payoffs are multiplied by a loss-aversion coefficient **lambda**
        ```
        def evaluate_payoff(self, payoff):
            if payoff < 0:
                return payoff * self.loss_aversion_lambda
            return payoff
        ```
    - *decision noise*: humans sometimes do not behave logically due to random error, fatigue, or distraction (e.g.: They might play Dove even though it has only been successful 45% of the time.)
        - use a softmax choice rule instead of rigid if/else choice, which allows for occasional irrational/random moves
        - **equation**: $$P(\text{Hawk}) = \frac{e^{\tau \cdot EU(\text{Hawk})}}{e^{\tau \cdot EU(\text{Hawk})} + e^{\tau \cdot EU(\text{Dove})}}$$
        - P(Hawk): probability of chosing Hawk
        - *e*: Euler's number
        - \tau: sensitivity to differences in expected utility; higher in healthy individuals, lower in schizophrenic individuals
        - *EU*: expected utility
    - *memory decay*: a player gives more weight to more recent events and tends to forget past history
        - **decay factor (gamma)**: applied to individual player's priors **alpha** and **beta** at the start of every round so that older observations slowly fade form memory
        - alpha and beta are priors from each player that get updated as the player observes their opponent
        - **equation**: alpha_new = gamma * alpha_old + New Observation
    - *prior belief strength*: extremely rigid for individuals with schizophrenia, flexible in healthy individuals
        - in healthy controls, use low initial priors that shift easily when presented new evidence
        - in schizophrenia group, use high priors that are rigid
   