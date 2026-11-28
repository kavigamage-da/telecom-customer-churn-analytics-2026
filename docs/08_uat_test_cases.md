# 08. UAT Test Cases

Run these in Power BI Desktop with no filters applied. Status is "To run" until you record the result. Expected values were calculated from customers.csv.

| ID | Requirement | Test steps | Expected result | Status |
|---|---|---|---|---|
| UAT-01 | FR-01 | Open Executive page; read the five KPI cards | 50,000 / 13.5% (6,760 of 50,000) / LKR 384K / 783 / LKR 51K | To run |
| UAT-02 | FR-02 | Read the contract chart | Month-to-Month 17.3%, One Year 8.8%, Two Year 9.0% | To run |
| UAT-03 | FR-02 | Read the product tier chart | Standard 15.0%, Basic 14.3%, Premium 9.0% | To run |
| UAT-04 | FR-03 | Read the extra churn chart | Month-to-Month 2,307; 30+ days inactive 1,471; 3+ tickets 1,236; New 416 | To run |
| UAT-05 | FR-04 | Read the tenure-month chart | Months 1-5 about 21-26% (red); month 6 about 15% | To run |
| UAT-06 | FR-05 | Open Drivers page; read the ticket chart | About 11% at 0-2 tickets; about 31% at 3-6 | To run |
| UAT-07 | FR-05 | Read the inactivity chart | 10.8 / 10.2 / 10.6 / 10.6% up to 30 days; 25.1 / 23.6 / 23.8% after | To run |
| UAT-08 | FR-05, FR-06 | Read warning-signal chart and heatmap | Neither 8.2%, Inactive only 21.8%, Tickets only 27.7%, Both 42.3%; New / Month-to-Month 26.7% | To run |
| UAT-09 | FR-07 | Open Risk page; count rows; read first row | 783 rows; first row CUST025125, 12 tickets, 31 days, Premium, Two Year, 96.48 | To run |
| UAT-10 | FR-08 | Select Region = Western; check all pages; clear the filter | Numbers update on all pages and return to the values above when cleared | To run |
| UAT-11 | FR-09, US-08 | Click each page button; check the High Risk rule text | Each button opens its page; the rule is shown on the Risk page | To run |
| UAT-12 | NFR-03 | Check the footer on all pages | Footer says the dataset is simulated | To run |
| UAT-13 | NFR-01 | Compare page size and colours | 1280 x 720; red used only for highlighted findings | To run |

Record the result (Pass/Fail), the tester and the date for each case, and keep screenshots for any failure.
