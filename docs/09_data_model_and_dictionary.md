# 09. Data Model and Data Dictionary

## 1. Model
A single fact table, `customers` (50,000 rows, one row per customer), plus a small helper table `Drivers` used only to build the extra-churn chart. There are no relationships.

`customers` (1 row per customer)  |  `Drivers` (4 rows: Month-to-Month, 30+ days inactive, 3+ support tickets, New (0-6 months))

## 2. Source fields (customers.csv)

| Field | Type | Description | Values / range |
|---|---|---|---|
| customer_id | Text | Pseudonymous customer identifier | CUST000000 format |
| signup_date | Date | Date the customer signed up | 2017-02-01 to 2022-12-01 |
| age | Whole number | Customer age | 18 to 71 |
| region | Text | Region | Central, Western, Eastern, Southern, Northern |
| product_tier | Text | Product tier | Basic, Standard, Premium |
| contract_type | Text | Contract | Month-to-Month, One Year, Two Year |
| payment_method | Text | Payment method | Credit Card, Online Wallet, Bank Transfer, Cash |
| tenure_months | Whole number | Months since signup | 1 to 71 |
| monthly_spend | Decimal | Monthly spend in LKR | 5.00 to 219.48 |
| spend_3m_ago | Decimal | Monthly spend three months earlier | Not used (no drop above 10%) |
| support_tickets | Whole number | Support tickets raised | 0 to 12 |
| last_login_days | Whole number | Days since last login | 0 to 180 |
| risk_score | Decimal | Generated churn probability in the synthetic data | Max 58; not used |
| churned | Whole number | 1 = churned, 0 = active | 0 or 1 |

## 3. Calculated columns

| Column | Purpose |
|---|---|
| Tenure Group, Tenure Sort | Five tenure groups, sorted in order |
| Inactivity Band, Inactivity Sort | Seven inactivity bands, sorted in order |
| Risk Tier | High Risk or Other |
| Warning Signals, Warning Signals Sort | Both signals / 3+ tickets only / Inactive 30+ days only / Neither |

## 4. Measures
Defined in `03_metric_dictionary.md` and `churn_measures.dax`.

## 5. Data quality checks (done)
50,000 rows and 14 columns; no missing values; no duplicate customer IDs; all categories as expected; churned only 0 or 1.
