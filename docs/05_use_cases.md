# 05. Use Cases

Diagram: `use_case_diagram.png`. Actors and goals are assumed.

| ID | Use case | Primary actor | Other actors |
|---|---|---|---|
| UC-01 | View executive summary | CEO | Retention Manager |
| UC-02 | Analyse churn drivers | Retention Manager | Support Lead, CRM Lead |
| UC-03 | View weekly call list | Retention Agent | Retention Manager |
| UC-04 | Filter by segment | Retention Manager | Retention Agent |
| UC-05 | Review metric definitions | Finance Analyst | |
| UC-06 | Refresh data | BI team | |
| UC-07 | Evaluate retention test (future, outside the dashboard) | Retention Manager | Finance Analyst |

## Use case specification: UC-03 View weekly call list

| Item | Detail |
|---|---|
| ID / Name | UC-03 View weekly call list |
| Primary actor | Retention Agent |
| Goal | Identify which at-risk customers to contact first this week |
| Trigger | Start of the working week |
| Preconditions | Data refreshed; dashboard published; the agent has view access |
| Business rules | High Risk = active customer (churned = 0) with 3+ support tickets and 30+ days since last login. List sorted by support tickets, then monthly spend, both descending |
| Related requirements | US-04, BR-02, FR-07, DR-02 |

**Main flow**
1. The agent opens the dashboard and selects the Risk page.
2. The system shows the High Risk customer list (customer ID, tickets, days inactive, tier, contract, monthly spend in LKR).
3. The agent reviews the first customers (highest tickets, then highest spend).
4. The agent contacts customers in the order shown and records the outcome in the team's call log.

**Alternate flows**
- A1: The agent filters by product tier, contract type or region with the slicers. The list and the tier chart update.
- A2: The Retention Manager assigns customers to the Call or Holdout group first (see the To-Be process). The agent calls the Call group only.

**Exceptions**
- E1: The data is out of date. The agent tells the BI team; the list is not used until refreshed.
- E2: No customers match the filters. The table is empty and the agent clears the filters.

**Postconditions:** Contacted customers are logged outside the dashboard. The dashboard does not store outcomes.

**Acceptance:** With no filters, the table shows 783 rows and the first row is CUST025125 (12 tickets, 31 days, Premium, Two Year, 96.48).
