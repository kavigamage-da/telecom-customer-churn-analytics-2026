-- BUSINESS QUESTION: Which active customers are High Risk right now, and how much monthly revenue do they represent?
-- DECISION: Defines the weekly call list shown on the Risk page.
-- FINDING: 783 active customers (3+ tickets AND 30+ days inactive) = LKR 51,001 monthly spend.
-- NOTE: risk_score in this synthetic dataset is the generated churn probability (max 58). It is not used.

-- A. High Risk customers and revenue at risk
SELECT COUNT(*)            AS high_risk_customers,
       SUM(monthly_spend)  AS monthly_revenue_at_risk
FROM customers
WHERE churned = 0 AND support_tickets >= 3 AND last_login_days > 30;

-- B. Churn rate by warning-sign combination (expected: 8.2 / 21.8 / 27.7 / 42.3)
SELECT CASE WHEN support_tickets >= 3 AND last_login_days > 30 THEN 'Both signals'
            WHEN support_tickets >= 3                          THEN '3+ tickets only'
            WHEN last_login_days > 30                          THEN 'Inactive 30+ days only'
            ELSE 'Neither signal' END AS warning_signals,
       COUNT(*)                        AS customers,
       ROUND(100.0 * AVG(churned), 1)  AS churn_rate_pct
FROM customers
GROUP BY 1
ORDER BY churn_rate_pct;
