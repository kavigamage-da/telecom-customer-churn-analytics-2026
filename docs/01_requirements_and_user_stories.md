# 01. Requirements and User Stories

**Project:** Customer Churn Analysis, Sri Lanka telecom (simulated data)
**Note:** Stakeholders and needs are assumed for this portfolio project. No real interviews were held.

## 1. Business objective
Help a telecom with 13.5% annual churn decide which customers to contact first and which retention levers to test. No numeric reduction target is set. The target is to be agreed after the holdout test (see `retention_process_bpmn.png`).

## 2. User stories (MoSCoW priority)

| ID | As a... | I want... | So that... | Priority |
|---|---|---|---|---|
| US-01 | Executive sponsor (CEO) | one page with churn rate, revenue lost and revenue at risk | I can see the size of the problem in under a minute | Must |
| US-02 | Retention Manager | churn rate by contract type, product tier and driver | I can choose where retention effort pays most | Must |
| US-03 | Retention Manager | to see where churn jumps by tickets, inactivity and tenure | I can set intervention triggers | Must |
| US-04 | Retention Agent | a ranked list of high-risk active customers | I contact the most at-risk, highest-spend customers first | Must |
| US-05 | Support Lead | to see churn by number of support tickets | I can set an escalation rule before the third ticket | Should |
| US-06 | CRM/Marketing Lead | the inactivity point where churn rises | I can time re-engagement messages | Should |
| US-07 | Retention Manager | filters for region, tier and contract | I can look at one segment at a time | Should |
| US-08 | Finance Analyst | written definitions for every metric | I can trust and reproduce the numbers | Must |
| US-09 | Retention Manager | a way to measure whether calls reduce churn | I can justify the budget with evidence | Could (process, outside the dashboard) |

## 3. Acceptance criteria

| Story | Acceptance criteria (checked against customers.csv) |
|---|---|
| US-01 | Executive page shows 50,000 customers, 13.5% churn (6,760 churned), LKR 384K monthly revenue lost, 783 high-risk active customers, LKR 51K monthly revenue at risk |
| US-02 | Contract chart: Month-to-Month 17.3%, One Year 8.8%, Two Year 9.0%. Tier chart: Standard 15.0%, Basic 14.3%, Premium 9.0%. Driver chart: 2,307 / 1,471 / 1,236 / 416 extra churned customers |
| US-03 | Ticket chart: about 11% at 0-2 tickets, about 31% at 3+. Inactivity chart: about 11% up to 30 days, about 25% from 31 days. Tenure-month chart: about 24% in months 1-5, about 15% after |
| US-04 | Table shows 783 rows, sorted by support tickets then monthly spend (both descending); first row is CUST025125 |
| US-05 | Ticket chart marks 3+ tickets in red and states "Intervene at ticket 2" |
| US-06 | Inactivity chart marks 31+ days in red |
| US-07 | Region, product tier and contract slicers work together and are synced across pages |
| US-08 | Metric dictionary (`03_metric_dictionary.md`) defines every KPI; High Risk rule printed on the Risk page |
| US-09 | Page 3 states a holdout test design: random Call/Holdout split, 90-day retention, threshold set before the test |

## 4. Requirements and traceability

| ID | Type | Requirement | Source | Dashboard element | Priority | Status |
|---|---|---|---|---|---|---|
| BR-01 | Business | Prioritise retention effort by segment size and rate | US-02 | Drivers chart (extra churn) | Must | Built |
| BR-02 | Business | Identify customers to contact this week | US-04 | Call-list table (Page 3) | Must | Built |
| BR-03 | Business | Quantify revenue lost and at risk | US-01 | KPI cards | Must | Built |
| FR-01 | Functional | Show total customers, churn rate, revenue lost, high-risk count, revenue at risk | US-01 | 5 KPI cards (Page 1) | Must | Built |
| FR-02 | Functional | Churn rate by contract type and product tier | US-02 | Two bar charts (Page 1) | Must | Built |
| FR-03 | Functional | Extra churn by driver | US-02 | Bar chart (Page 1) | Must | Built |
| FR-04 | Functional | Churn by tenure month | US-03 | Column chart (Page 1) | Should | Built |
| FR-05 | Functional | Churn by tickets, inactivity band, warning-sign combination | US-03, 05, 06 | Three charts (Page 2) | Must | Built |
| FR-06 | Functional | Tenure x contract churn heatmap | US-03 | Matrix (Page 2) | Should | Built |
| FR-07 | Functional | Filtered, sorted list of High Risk customers | US-04 | Table (Page 3) | Must | Built |
| FR-08 | Functional | Slicers for region, tier, contract, synced | US-07 | Slicers (Pages 1-3) | Should | Built |
| FR-09 | Functional | Page navigation between three pages | US-01 | Navigator | Should | Built |
| NFR-01 | Non-functional | Consistent 1280 x 720 layout, one colour rule (red = problem, grey = default) | US-01 | All pages, theme file | Should | Built |
| NFR-02 | Non-functional | Readable text contrast, alt text on every visual | all | All visuals | Should | In progress |
| NFR-03 | Non-functional | Footer states the data is simulated | US-08 | Footer text box | Must | Built |
| NFR-04 | Non-functional | Data refresh weekly | US-04 | Refresh schedule | Could | Not applicable (static CSV) |
| DR-01 | Data | Source is customers.csv, 50,000 rows, 14 fields; customer_id is a pseudonymous ID | all | Data model | Must | Built |
| DR-02 | Data | Churn flag 1/0, with High Risk = active, 3+ tickets, 30+ days inactive | US-04 | Risk Tier column | Must | Built |

## 5. Out of scope
Predictive model, live CRM connection, cost per retention action, real customer interviews.

## 6. Assumptions and constraints
- Dataset is synthetic; ticket and inactivity effects are built into it and cannot be validated on the public IBM Telco dataset, which has no such fields.
- Single snapshot: tenure and signup cohort cannot be separated.
- No cost data, so no ROI is claimed.
