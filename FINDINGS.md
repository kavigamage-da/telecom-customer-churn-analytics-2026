# Findings

All figures are calculated from `data/customers.csv` (50,000 simulated customers). They show association in simulated data, not cause.

| # | Finding | Evidence | Suggested action |
|---|---|---|---|
| 1 | Month-to-Month is the largest churn pool | 17.3% vs 8.8-9.0% on annual contracts; 70% of all churned customers; about 2,307 extra churned customers | Offer annual contracts |
| 2 | Churn steps up after 30 days inactive | 10.6% up to day 30 vs 24.5% after (day 30 about 11%, day 31 about 26%) | Re-engage before day 30 |
| 3 | Churn steps up at the third ticket | 11.0% at 0-2 tickets vs 30.9% at 3+ (about 2.8x) | Intervene at ticket 2 |
| 4 | The two warning signs compound | 42.3% with both (n=1,357; 574 already churned, 783 still active) vs 8.2% with neither (n=34,521) | Start the call list with the 783 active customers |
| 5 | First months are the riskiest | About 24% in months 1-5 vs about 15% in months 6-12 | Onboarding focus; test it |
| 6 | Premium churns less | 9.0% vs 14.3% (Basic) and 15.0% (Standard) | Tier-specific retention |

High Risk (783 customers, LKR 51,001 monthly spend) = active customer with 3+ support tickets AND 30+ days inactive.

Prove impact with a random Call vs Holdout test, 90-day retention, and a success threshold set before the test. No ROI is claimed: the dataset has no cost or outcome data.
