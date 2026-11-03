
# Define Priors:
    # Learning Level (alpha): probability of an agent updatin its mixed strategy vector after a round
    # alpha ~ beta(2, 5)

    # Conflict Sensitivity (lambda): penalty weight applied to payoff matrix following a mutual clash
    # gamma ~ normal(0, 1)

    # Tactial Self-Preservation Profile (theta): proabbility distribution across the categorical self-preservation choices:
        # self-preservation choices: 
        # 1 (Escalate): Counter-attack or raise the stakes ($H$). Accepts mutual clash risk to force the opponent to yield.
        # 2 (Avoid Repair): Refuse conciliation or maintain a defensive stance without retreating or investing in peace.
        # 3 (Withdraw): Complete retreat/concede ($D$). Surrenders the payoff to eliminate the risk of a mutual clash ($\gamma$).
        # 4 (Deflect / Alternative Tactic): De-escalate via external signaling, posturing, or delegating risk without a full retreat.
    # theta is modeled sequentially across 3 categories (sequential decomposition)
    # 1. theta_1 ~ Beta(1, 2)
    # 2. theta_2_prime ~ Beta(1, 1), theta_2 = theta_2_prime * (1 - theta_1)
    # 3. theta_3 = 1 - (theta_1 + theta_2)

    # Recovery Speed parameter (lambda): he rate parameter governing the geometric/negative binomial distribution of adjustment speed ($T_{\text{repair}}$)
    # lambda ~ Gamma(2, 2)