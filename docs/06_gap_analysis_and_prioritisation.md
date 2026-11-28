# 06. Gap Analysis and Prioritisation

## 1. Gap analysis: As-Is vs To-Be

| Area | As-Is (assumed) | To-Be | Gap | Closed by |
|---|---|---|---|---|
| Visibility | Weekly ad hoc data request; no live view | Dashboard with churn, revenue lost and revenue at risk | No standing view of churn | Executive page (FR-01) |
| Identifying at-risk customers | None; churn is seen after customers leave | Weekly list of High Risk active customers | No early-warning rule | High Risk rule and Risk page (FR-07) |
| Support tickets | Each ticket closed individually; no trigger | Intervene at ticket 2 | No escalation rule | Ticket chart and agreed rule (FR-05) |
| Inactivity | No re-engagement timing | Re-engage before day 30 | No threshold known | Inactivity chart (FR-05) |
| Contract strategy | Not segmented | Annual-contract offers to Month-to-Month | No sizing of the biggest pool | Extra-churn chart (FR-03) |
| New customers | Treated like others | Focus on first 5 months | Higher early churn not visible | Tenure charts (FR-04, FR-06) |
| Metric definitions | Not documented; earlier figures could not be reproduced | Metric dictionary and printed High Risk rule | No single source of truth | `03_metric_dictionary.md` |
| Proving impact | No test | Random Call/Holdout test with 90-day retention | No evidence calls work | Test plan (US-09) |
| Contact timing | After the customer has left | Before the customer leaves | Reactive process | To-Be process |

## 2. Prioritisation: impact vs effort

Impact uses the size of each driver from the data (extra churned customers, an upper bound; drivers overlap). Effort is a judgement, labelled as an assumption.

| Action | Impact (extra churned customers) | Effort (assumed) | Priority |
|---|---|---|---|
| Weekly call list for High Risk customers (783) | Targets the 783 active customers with both signals (the 574 others already churned) | Low (list exists) | Do first |
| Re-engagement before day 30 | About 1,471 | Low (automated message) | Do first |
| Annual-contract offers for Month-to-Month | About 2,307 | Medium (offer design, pricing) | Plan next |
| Escalation rule at ticket 2 | About 1,236 | Medium (process change in support) | Plan next |
| Onboarding programme for first 5 months | About 416 | High (new programme) | Later |

Diagram: `impact_effort_matrix.png`.

## 3. MoSCoW summary
- **Must:** call list, High Risk rule, metric definitions, Executive page.
- **Should:** inactivity and ticket thresholds, contract offers, slicers.
- **Could:** onboarding programme, live refresh.
- **Won't (this phase):** predictive model, CRM integration, ROI.
