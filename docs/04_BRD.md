# 04. Business Requirements Document (BRD)

| Field | Detail |
|---|---|
| Project | Customer Churn Analytics Dashboard, Sri Lanka telecom |
| Version | 1.0 |
| Author | Kavindi Gamage (Business / BI Analyst) |
| Status | Portfolio project on a simulated dataset. Stakeholders and sign-offs are assumed |

## 1. Executive summary
The company loses 13.5% of its customers (6,760 of 50,000), worth LKR 384,075 in monthly revenue. There is no early-warning view, so retention effort goes to customers who have already left. This project delivers a three-page Power BI dashboard and a defined process that identify at-risk customers, size the churn drivers, and support a measured retention test.

## 2. Business problem and opportunity
- Churn is reviewed reactively: management asks each Monday "who are we losing?" and receives a list of customers who have already churned.
- No rule triggers action when a customer raises many support tickets or stops logging in.
- Opportunity: the analysis shows churn rises sharply at the third support ticket (about 11% to 31%) and after 30 days inactive (about 11% to 25%), and that 1,357 customers show both signs: 42% of them have churned (574), and the 783 still active form the call list.

## 3. Objectives and success criteria

| ID | Business objective | Success criterion | How measured |
|---|---|---|---|
| OBJ-1 | Give leadership one view of churn size and revenue impact | Executive page shows churn rate, revenue lost, high-risk count and revenue at risk | UAT-01 to UAT-03 |
| OBJ-2 | Show where churn comes from | Charts show churn by contract, tier, tickets, inactivity, tenure, with extra churn by driver | UAT-04 to UAT-08 |
| OBJ-3 | Give the retention team a weekly ranked call list | List of High Risk active customers, sorted by tickets then spend | UAT-09 |
| OBJ-4 | Make definitions transparent and reproducible | Metric dictionary covers every KPI; High Risk rule shown on the page | UAT-11 |
| OBJ-5 | Prove whether retention calls work | Random Call/Holdout test with 90-day retention and a threshold set in advance | Test plan (post-launch) |

No numeric churn-reduction target is set. It will be agreed with Finance after the first test.

## 4. Scope

| In scope | Out of scope |
|---|---|
| Three-page Power BI dashboard (Executive, Drivers, Risk) | Predictive churn model |
| Metric definitions and High Risk rule | Live CRM integration or real-time refresh |
| Ranked weekly call list | Cost per retention action and ROI |
| As-Is and To-Be process, requirements, UAT | Automated email or call campaigns |
| Holdout test design | Real customer interviews or data |

## 5. Stakeholders
See `02_stakeholders_and_raci.md`. Primary users: CEO (Executive page), Retention Manager (Drivers page), Retention Agents (Risk page).

## 6. Business requirements
See `01_requirements_and_user_stories.md` (BR-01 to BR-03, FR-01 to FR-09, NFR-01 to NFR-04, DR-01 to DR-02) and the traceability matrix in section 4 of that document.

## 7. Assumptions
1. The dataset is a snapshot at December 2022 and is simulated; findings show association, not cause.
2. High Risk = active, 3+ tickets, 30+ days inactive. The Retention Manager would approve this rule.
3. The call team can contact at most the 783 customers on the list; capacity is not modelled.
4. Monthly spend is in LKR.
5. customer_id is a pseudonymous identifier and no personal data is included.

## 8. Constraints
- Single source table (customers.csv) with no cost, campaign or outcome data.
- No ticket-level or login-level history, so trends over time cannot be examined.
- Tools: Power BI Desktop; page size 1280 x 720.
- Tenure and signup cohort cannot be separated in one snapshot.

## 9. Dependencies
| Dependency | Needed for | Owner (assumed) |
|---|---|---|
| Weekly data extract with the same fields | Call list | BI team |
| Agreement on the High Risk rule | Call list, KPIs | Retention Manager |
| Call capacity for the Call group | Holdout test | Retention Manager |
| Success threshold agreed before the test | Test decision | Finance, Retention Manager |

## 10. Risks
See `07_risk_register.md`.

## 11. Delivery plan
See `10_delivery_plan.md`.

## 12. Approval (assumed, for illustration)

| Role | Name | Decision | Date |
|---|---|---|---|
| Executive sponsor | (assumed) | Pending | |
| Retention Manager | (assumed) | Pending | |
| Finance | (assumed) | Pending | |
