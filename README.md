# Customer Churn Analysis: Sri Lanka Telecom (Simulated Data)

**Tools:** Python · SQL · Power BI · DAX | **Role:** Business / BI Analyst

> **Result in one line:** On a simulated 50,000-customer telecom base (13.5% churn, LKR 384K monthly revenue lost), I built a three-page Power BI dashboard that sizes each churn driver, identifies 783 high-risk active customers (LKR 51K monthly revenue at risk), and proposes a measured retention test.

> **Scope note:** The dataset is synthetic. The value of this project is the analytical workflow, metric definitions and decision support, not claims about the real Sri Lankan market.

---

## Preview

**Power BI dashboard**

![Executive Summary](screenshots/dashboard_1_executive_summary.png)

![Churn Drivers](screenshots/dashboard_2_churn_drivers.png)

![Customer Risk](screenshots/dashboard_3_customer_risk.png)

**Business Analysis – Impact and Effort Matrix**

![Impact Effort Matrix](screenshots/impact_effort_matrix.png)

**Proposed weekly retention process (To-Be, BPMN)**

![To-Be retention process](diagrams/retention_process_bpmn.png)

**Context diagram**

![Context diagram](diagrams/context_diagram.png)

The full case study is in [churn_case_study.pdf](churn_case_study.pdf). Findings with evidence are in [FINDINGS.md](FINDINGS.md).

---

## 1. Business problem and decision

A telecom loses 13.5% of its customers. The retention team has limited capacity. **Decision to support:** which customers should be contacted first, and which retention levers are worth testing?

## 2. Data and metric definitions

- 50,000 customers: contract, product tier, region, tenure, spend, support tickets, days since last login, churn flag.
- **Churn rate** = churned customers / total customers.
- **High Risk** = active customer with 3+ support tickets AND 30+ days inactive (783 customers, LKR 51,001 monthly spend).
- **Extra churn** (per driver) = churned customers in the group minus (group size x churn rate of the rest of the base). An upper bound, not a forecast. Drivers overlap.

## 3. Findings (verified against customers.csv)

| # | Finding | Evidence |
|---|---|---|
| 1 | Month-to-Month is the largest churn pool | 17.3% vs 8.8-9.0% on annual contracts; 70% of all churned customers; about 2,300 extra churned customers |
| 2 | Churn steps up after 30 days inactive | 10.6% up to day 30 vs 24.5% after; the step falls between day 30 (11%) and day 31 (26%) |
| 3 | Churn steps up at the third support ticket | 11.0% at 0-2 tickets vs 30.9% at 3+ (about 2.8x) |
| 4 | The two warning signs compound | 42.3% churn with both (n=1,357; 574 already churned, 783 still active) vs 8.2% with neither (n=34,521) |
| 5 | First months are the riskiest | About 24% in months 1-5 vs about 15% in months 6-12; New Month-to-Month customers churn at 26.7% |
| 6 | Premium churns less | 9.0% vs 14.3% (Basic) and 15.0% (Standard) |

Region differs by under 1 point (13.1-14.0%), so it is not a priority lever. Western holds the most lost revenue only because it is the largest region.

## 4. Validation on real data (IBM Telco, 7,043 customers)

| Pattern | Simulated data | IBM Telco | Held? |
|---|---|---|---|
| Month-to-Month churns more | 17.3% vs 8.9% | 42.7% vs 6.8% | Yes (stronger) |
| New customers churn more | 22% (0-6m) vs 10.5% (36m+) | 52.9% vs 11.9% | Yes (stronger) |
| Support tickets, inactivity days | see above | No such columns in IBM Telco | **Cannot be validated** |

Only the contract and tenure patterns are validated on real data. Ticket and inactivity effects are specific to the simulated dataset.

## 5. Recommendations

1. Offer annual contracts to Month-to-Month customers (largest pool).
2. Re-engage before day 30 of inactivity.
3. Intervene at ticket 2, before ticket 3.
4. Start the call list with the 783 active customers who show both warning signs (574 of the 1,357 with both signs have already churned).

## 6. How I would prove it works

Randomly split the 783 high-risk customers into a Call group and a Holdout group. Primary metric: share still active after 90 days. Set the success threshold before the test. Size the budget from measured uplift, not assumed conversion.

## 7. Limitations and what I would do with real data

- Synthetic data: churn was generated from a set of rules, so the analysis recovers those rules. It demonstrates the method.
- The spend-drop hypothesis could not be tested: in this dataset no customer's spend falls more than 10% over 3 months.
- Single snapshot: tenure and signup date move together, so a cohort effect cannot be separated from a tenure effect.
- Findings show association, not cause.
- With real CRM data: use real churn labels, add a holdout test, fit a model with cross-validation, and add cost per retention action to compute ROI.

## 8. Repository guide

```text
telecom-customer-churn-analytics-2026/
├── README.md                      this case study
├── churn_case_study.pdf            case study PDF (20 pages) for sharing
├── FINDINGS.md                    findings with evidence
├── data/                           customers.csv (simulated), generate_dataset.py
├── sql/                            11 business queries (01-11)
├── notebooks/                      01_eda_generated.ipynb
├── powerbi/                        churn_dashboard.pbix, churn_measures.dax, churn_theme.json
├── screenshots/                    the three dashboard pages
├── diagrams/                       BPMN, context, use case (PNG and editable .drawio)
└── docs/                           BA documents
```

| Document | Purpose |
|---|---|
| docs/00_methodology.md | Data, definitions, validation, limitations |
| docs/01_requirements_and_user_stories.md | User stories, acceptance criteria, traceability |
| docs/02_stakeholders_and_raci.md | Stakeholder map and RACI (assumed) |
| docs/03_metric_dictionary.md | Every KPI: definition, DAX, value, caveat |
| docs/04_BRD.md | Business requirements document |
| docs/05_use_cases.md | Use cases and the UC-03 specification |
| docs/06_gap_analysis_and_prioritisation.md | As-Is vs To-Be, impact vs effort |
| docs/07_risk_register.md | 11 risks with mitigations |
| docs/08_uat_test_cases.md | 13 UAT cases with expected values |
| docs/09_data_model_and_dictionary.md | Data model and field dictionary |
| docs/10_delivery_plan.md | Indicative delivery plan |

## 9. How to run

```bash
git clone https://github.com/kavigamage-da/telecom-customer-churn-analytics-2026
cd telecom-customer-churn-analytics-2026
pip install -r requirements.txt
python data/generate_dataset.py     # optional: regenerates the simulated data
```

Run the queries in `sql/` in order (01 to 11) against `data/customers.csv`, or open `powerbi/churn_dashboard.pbix` in Power BI Desktop and apply `powerbi/churn_theme.json`.

---

*Built by Kavindi Gamage. All stakeholders, processes and sign-offs in the documents are assumed for a simulated project.*
