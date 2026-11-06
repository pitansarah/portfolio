""""hawk-dove-simulation.py
This document is a written program of the hawk-dove game played by 2 groups, 
the control and the experimental group (involving an individual with schizophrenia).
The code for this program was modeled after Dr. Xue (University of Florida) and can be
found here: https://cmp.phys.ufl.edu/PHZ4710/files/unit8/hawk-dove.html.
"""


import numpy as np

# --- GAME ---
class ControlHawkDove(SymmetricGame):
    """" simulate the hawk-dove game for the control group (both healthy)"""
    def __init__(self, V, C, opp_dist, record=True):
        """ 
        initialize game 
        arguments:
        V: reward
        C: cost of losing
        opp_dist: probability distribution of what strategy opponent is likely to play,
        ex: [0.7, 0.3] opponent plays Hawk 70% of the time and Dove 30% of the time
        """
        pay_mat = [(V-C)/2, V], [0, V/2]
        """
        payoff matrix:
        top-left: (V-C)/2: Hawk-Hawk payoff for Hawks
        top-right: V: Hawk-Dove payoff for Hawk
        Bottom-left: 0: Hawk-Dove payoff for Dove
        Bottom-right: V/2: Dove-Dove payoff for Doves
        """
        SymmetricGame.__init(self, opp_dist, pay_mat, record)
        """ callling parent class initializaton function"""

        V = 1   # reward if one wins
        C = 2   # cost due to injury if one loses, C > V\
        """defining parameters"""

        opp_dist = []
        """update own_dist dynamically using Bayesian belief updating model (see notes)"""

# --- Glossary ---
#   memory variables:
#       self.history_actions: a list recording every round's moves (my_move and opp_move)
#       self.alpha & self.beta: accumulate weighted evidence of whether opponent plays alpha (Hawk) or beta (Dove)
#   behavioral adjustment variables:
#       probability calculations: 
#       payoff calculations
#       regret calculations


# --- BELIEF UPDATER COMPONENTS (Drivers) ---
class LearningDriver:
    def __init__(self):
        self.history_actions =[]
        """alpha: accumulated evidence that the opponent chooses Hawk"""
        """beta: accumnulated evidence that the opponent chooses Dove"""
        # this is equivalent to Beta(1, 1,), which is a uniform prior distribution, meaning both Hawk & Dove are equally plausible
        self.alpha = 1.0
        self.beta = 1.0
    
    def play_round(self, my_action, opponent_action):
        """updates rounds, records self actions, updates opponent actions"""

        self.history_actions.append({
            'my_move': my_action,
            'opp_move': opponent_action
        })
    # if opponent plays Hawk, it adds one to the alpha counter
    # if opponent plays Dove, it adds one to the beta counter

        if opponent_action == 0:
            self.alpha += 1.0
        else:
            self.beta +=1.0
class RegretDriver:
    def __init__(self, base_omega = 0.3):
        # "Remember the original baselline omega, which is sensitivity to regeret."
        self.base_omega = base_omega
        # Stores current omega value, which can change.
        self.omega = base_omega
        # This variable controls how regret sensitivity changes over time. 1.0 means that the player's regret does not decrease at all. 
        self.sensitivity_decay = 0.90
    def omega_update(self, my_action, opponent_action, payoff):
        """Updates omega based on the payoff from the last round."""
        if payoff < 0:
            # Temporarily increase regret sensitivity due to negative payoff and ensure that omega never exceeds 1.0.
            self.omega = min(1.0, self.omega + 0.2)
        else:
            # gradually decay towards omega baseline
            self.omega = self.base_omega + (self.omega - self.base_omega) * self.sensitivity_decay
        return self.omega

class LossProcessingDriver:
    # gain_weight: how much the player values gains (control: 1.0, schizophrenic: 0.5 - 0.7 or 2.0 - 2.7)
    # loss aversion lambda is how much the player is averse to losses (control value modelled according to behavioral economics)
    def __init__(self, gain_weight = 1.0, loss_aversion_lambda = 2.25):
        self.gain_weight = gain_weight
        self.loss_aversion_lambda = loss_aversion_lambda
    def evaluate_payoff(self, payoff):
        """Evaluates how useful payoff is by weighting positive payoffs and negative payodds separately"""
        if payoff >= 0:
            return payoff * self.gain_weight
        else:
            return payoff * self.loss_aversion_lambda

# --- BELIEF UPDATER ---
class BayesianBeliefUpdater:
    """include all components of Bayesian belief updating here"""
    def __init(self):
        self.drivers = [
            LearningDriver(),
            RegretDriver(),
            LossProcessingDriver(),

        ]
    # update_round loops through all belief drivers and passes them to actions 
    # so players can update memory vars and behavioral adjustment vars 
    def update_round(self, my_action, opponent_action):
        for drive in self.drivers:
            if hasattr(drive, 'play_round'):
                drive.play_round(my_action, opponent_action)
        

# --- PLAYERS --- 
# 1A + 1B = control group (healthy)
# 2A + 2B = experimental group, player 2B is schizophrenic

class Agent_1A:
    def __init__(self):
        self.belief_updater = BayesianBeliefUpdater()

class Agent_1B

class Agent_2A

class Agent_2B

# --- EXECUTION SCRIPT ---
if __name__ == '__main__':
    # create agent instances
    agent_1 = LearningDriver()

    # simulate 10 rounds of the conflict (0 = Hawk, 1 = Dove)
    for round_num in range(1, num_rounds +1):
        move_1 = agent_1.choose_action()
        move_2 = 

