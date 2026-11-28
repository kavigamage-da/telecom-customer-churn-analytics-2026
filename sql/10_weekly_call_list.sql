-- BUSINESS QUESTION: Which customers should the retention team call THIS WEEK?
-- DECISION: Weekly call list, ranked by support tickets then monthly spend.
-- FINDING: 783 customers; first row CUST025125 (12 tickets, 31 days inactive, Premium, Two Year, 96.48).

SELECT customer_id, support_tickets, last_login_days, product_tier, contract_type, monthly_spend
FROM customers
WHERE churned = 0 AND support_tickets >= 3 AND last_login_days > 30
ORDER BY support_tickets DESC, monthly_spend DESC;
