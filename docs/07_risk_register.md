# 07. Risk Register

Scale: Likelihood and Impact 1 (low) to 3 (high). Score = Likelihood x Impact. Owners are assumed roles.

| ID | Risk | L | I | Score | Mitigation | Owner |
|---|---|---|---|---|---|---|
| R-01 | Dataset is synthetic, so findings may not hold on real data | 3 | 3 | 9 | Label the data as simulated; validate on real data before any decision; contract and tenure patterns already checked on IBM Telco | Analyst |
| R-02 | Ticket and inactivity effects cannot be validated on public data | 3 | 2 | 6 | State this limit; run the holdout test on real customers | Analyst |
| R-03 | Stakeholders disagree on the High Risk rule | 2 | 3 | 6 | Document the rule; get Retention Manager approval; change log in the metric dictionary | Retention Manager |
| R-04 | Overlapping drivers are added together and overstate impact | 2 | 3 | 6 | Mark extra churn as an upper bound; show the overlap (1,357 customers with both signs, 783 still active) | Analyst |
| R-05 | Tenure effect is read as a cohort effect | 2 | 2 | 4 | Single snapshot; state that the two cannot be separated | Analyst |
| R-06 | Small samples at high ticket counts (9-12 tickets have under 50 customers each) mislead | 2 | 2 | 4 | Note on the chart; do not set rules from those bars | Analyst |
| R-07 | Call capacity is lower than 783 customers | 2 | 2 | 4 | Work down the ranked list; confirm capacity before the test | Retention Manager |
| R-08 | Customer data is misused or shared (privacy) | 1 | 3 | 3 | Use pseudonymous IDs; limit report access; no personal data in the model | BI team |
| R-09 | Holdout group means some high-risk customers are not called | 2 | 2 | 4 | Hold out a small, agreed share; review ethics and business acceptance first | Retention Manager |
| R-10 | Dashboard numbers are changed by mistake | 1 | 2 | 2 | UAT checks against expected values; metric dictionary | BI team |
| R-11 | Data refresh is late, so the call list is out of date | 2 | 2 | 4 | Refresh before the weekly call; exception E1 in UC-03 | BI team |
