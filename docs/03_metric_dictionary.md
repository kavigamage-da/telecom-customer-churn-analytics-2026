# 03. Metric Dictionary

Source table: `customers` (customers.csv, 50,000 rows). Values below are current for the full dataset with no filters. Owner roles are assumed.

## 1. Core metrics

| Metric | Business definition | DAX / logic | Value | Owner | Caveat |
|---|---|---|---|---|---|
| Total Customers | Customers in the base | `COUNTROWS ( customers )` | 50,000 | BI team | Snapshot |
| Churned Customers | Customers who left | `CALCULATE ( COUNTROWS ( customers ), customers[churned] = 1 )` | 6,760 | BI team | |
| Churn Rate | Share of customers who churned | `DIVIDE ( [Churned Customers], [Total Customers] )` | 13.5% | Retention Manager | Not an annualised rate |
| Overall Churn Rate | Benchmark for charts; ignores filters | `CALCULATE ( [Churn Rate], ALL ( customers ) )` | 13.5% | BI team | Used for dashed lines |
| Monthly Revenue Lost | Monthly spend of churned customers | `CALCULATE ( SUM ( customers[monthly_spend] ), customers[churned] = 1 )` | LKR 384,075 | Finance | Historical, already lost |
| High Risk Customer | Active customer with 3+ tickets and 30+ days inactive | `Risk Tier = "High Risk"` | 783 | Retention Manager | Rule-based, not a model score |
| Monthly Revenue at Risk | Monthly spend of High Risk customers | `CALCULATE ( SUM ( customers[monthly_spend] ), customers[churned] = 0, customers[support_tickets] >= 3, customers[last_login_days] > 30 )` | LKR 51,001 | Finance | Forward-looking; not all will churn |

## 2. Driver metrics

| Metric | Definition | Logic | Value | Caveat |
|---|---|---|---|---|
| Extra Churn (driver) | Churned customers in the group beyond the rest-of-base rate | `group churned - group size x rest-of-base churn rate` | MTM 2,307; inactive 1,471; tickets 1,236; new 416 | Upper bound; drivers overlap; association, not cause |
| Ticket Multiple | Churn at 3+ tickets divided by churn at 0-2 tickets | `[Churn Rate 3+ Tickets] / [Churn Rate 0-2 Tickets]` | 2.8x (30.9% / 11.0%) | |
| Warning Signals | Combination of the two warning signs | `Both signals / 3+ tickets only / Inactive 30+ days only / Neither signal` | 42.3% / 27.7% / 21.8% / 8.2% churn | Both signals n=1,357 (574 churned, 783 active = High Risk) |

## 3. Dimensions (calculated columns)

| Field | Definition |
|---|---|
| Tenure Group | New (0-6m), Growing (7-12m), Established (13-24m), Loyal (25-36m), Champion (36m+) from `tenure_months` |
| Inactivity Band | 0-7, 8-14, 15-21, 22-30, 31-45, 46-60, 60+ days from `last_login_days` |
| Risk Tier | High Risk or Other, using the High Risk rule |

## 4. Fields not used
- `risk_score`: in this synthetic dataset it is the generated churn probability (it maxes at 58), not a model output. It is not used anywhere in the dashboard.
- `spend_3m_ago`: no customer's spend falls more than 10% in the data, so the spend-drop hypothesis cannot be tested.

## 5. Change log
| Change | Reason |
|---|---|
| High Risk redefined as 3+ tickets and 30+ days inactive | Earlier rule (`risk_score >= 60`) matched no customers; earlier LKR 68K / 471 figures could not be reproduced |
| Ticket effect restated as 2.8x | Earlier 4.2x compared 12 tickets only |
