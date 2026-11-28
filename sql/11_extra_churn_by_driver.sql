-- BUSINESS QUESTION: Which churn driver accounts for the most customers lost beyond the rest-of-base rate?
-- DECISION: Prioritise retention levers by volume, not only by rate.
-- FINDING (expected): Month-to-Month 2,307 | 30+ days inactive 1,471 | 3+ tickets 1,236 | New 0-6 months 416.
-- NOTE: Upper bound. Drivers overlap, so the rows must not be added together.
-- Extra churn = group churned - group size x churn rate of the rest of the base.

WITH t AS (SELECT COUNT(*) AS n, SUM(churned) AS c FROM customers),
g AS (
  SELECT 'Month-to-Month' AS driver, COUNT(*) AS n, SUM(churned) AS c FROM customers WHERE contract_type = 'Month-to-Month'
  UNION ALL SELECT '30+ days inactive', COUNT(*), SUM(churned) FROM customers WHERE last_login_days > 30
  UNION ALL SELECT '3+ support tickets', COUNT(*), SUM(churned) FROM customers WHERE support_tickets >= 3
  UNION ALL SELECT 'New (0-6 months)', COUNT(*), SUM(churned) FROM customers WHERE tenure_months <= 6
)
SELECT g.driver, g.n AS customers, g.c AS churned,
       ROUND(g.c - g.n * 1.0 * (t.c - g.c) / (t.n - g.n), 0) AS extra_churn
FROM g CROSS JOIN t
ORDER BY extra_churn DESC;
