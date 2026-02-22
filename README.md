# Digital Payment Fraud Detection Analysis 🕵️‍♂️💳

## 📌 Project Overview
As digital transactions grow, so does the risk of financial fraud. This project explores a dataset of digital payments to uncover patterns, identify high-risk channels, and quantify the financial impact of fraudulent activities. 

Using **MySQL**, raw transactional data was transformed into structured, actionable insights through exploratory data analysis (EDA), data aggregation, and the creation of optimized analytical views. The findings are visualized in a comprehensive dashboard.

## 📂 Dataset Description
The analysis leverages the `Digital_Payment_Fraud_Detection.csv` dataset, which includes the following key features:
* **Transaction Metrics:** `transaction_amount`, `transaction_type` (Transfer, Payment, Withdrawal), `is_international`
* **User & Device Data:** `payment_mode` (UPI, Card, NetBanking, Wallet), `device_type`, `device_location`, `account_age_days`
* **Risk & Behavioral Indicators:** `previous_failed_attempts`, `ip_risk_score`, `login_attempts_last_24h`
* **Target Variable:** `fraud_label` (0 for Legitimate, 1 for Fraud)

## 🛠️ Tools & Technologies
* **Database Management:** MySQL
* **Key SQL Concepts Used:**
  * Data Aggregation & Grouping (`SUM`, `AVG`, `COUNT`, `GROUP BY`)
  * Conditional Logic (`CASE WHEN`)
  * View Creation for modular analysis (`CREATE VIEW`)
  * Sorting and Limiting for top-tier threat identification
* **Visualization:** Power BI

## 📊 Key Analytical Views & Insights
The core of this project is contained within `digital_payment_fraud_detection.sql`, which generates several views to answer critical business questions:

1. **Overall Fraud Rate (`vw_overall_fraud_rate`):** Calculates the baseline percentage of fraudulent transactions across the entire dataset.
2. **Financial Impact (`vw_financial_impact_by_class`):** Compares the average and maximum transaction amounts between legitimate and fraudulent activities.
3. **Channel Risk Profile (`vw_channel_risk_profile`):** Identifies which payment modes (e.g., UPI, Card) and transaction types are most susceptible to fraud.
4. **Geographical Threat Landscape (`vw_geographical_threat_landscape`):** Pinpoints the top 10 cities/locations with the highest volume of fraudulent transactions.

## 📈 Dashboard Visualization

<img width="1325" height="739" alt="dashboard_snapshot jpg" src="https://github.com/user-attachments/assets/193e1c9a-0a7b-4510-944c-97fd047fd990" />


## 🚀 How to Run This Project
1. Clone this repository to your local machine.
2. Open your preferred SQL environment (e.g., MySQL Workbench).
3. Create a new database and import the `Digital_Payment_Fraud_Detection.csv` data into a table named `digital_payment_fraud_detection`.
4. Open and execute the `digital_payment_fraud_detection.sql` script. This will set up the database schema and create the analytical views.
5. Query the newly created views to explore the data (e.g., `SELECT * FROM vw_overall_fraud_rate;`).

## ✉️ Contact
Feel free to reach out if you have any questions or suggestions about this analysis!
* **LinkedIn:** [https://www.linkedin.com/in/rahul-agarwal-184596272/]
* **Email:** [rahulagarwal828269@gmail.com]
