CREATE DATABASE digital_payment_fraud_detection;
USE digital_payment_fraud_detection;


SELECT 
    COUNT(transaction_id) AS total_transactions,
    SUM(fraud_label) AS total_frauds,
    ROUND((SUM(fraud_label) / COUNT(transaction_id)) * 100, 2) AS fraud_percentage
FROM digital_payment_fraud_detection;



SELECT 
    CASE WHEN fraud_label = 1 THEN 'Fraud' ELSE 'Legitimate' END AS transaction_status,
    ROUND(AVG(transaction_amount), 2) AS avg_amount,
    MAX(transaction_amount) AS max_amount
FROM digital_payment_fraud_detection
GROUP BY fraud_label;



SELECT 
    payment_mode,
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(fraud_label) AS fraud_cases,
    ROUND((SUM(fraud_label) / COUNT(*)) * 100, 2) AS fraud_rate
FROM digital_payment_fraud_detection
GROUP BY payment_mode, transaction_type
ORDER BY fraud_rate DESC;


SELECT 
    device_location,
    COUNT(transaction_id) AS total_transactions,
    SUM(fraud_label) AS total_frauds
FROM digital_payment_fraud_detection
GROUP BY device_location
ORDER BY total_frauds DESC
LIMIT 10;


SELECT 
    is_international,
    COUNT(*) AS total_transactions,
    SUM(fraud_label) AS total_frauds,
    ROUND((SUM(fraud_label) / COUNT(*)) * 100, 2) AS fraud_rate
FROM digital_payment_fraud_detection
GROUP BY is_international;


SELECT 
    transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(fraud_label) AS fraud_cases,
    ROUND((SUM(fraud_label) / COUNT(*)) * 100, 2) AS fraud_rate
FROM digital_payment_fraud_detection
GROUP BY transaction_hour
ORDER BY fraud_rate DESC;


SELECT 
    user_id,
    transaction_amount,
    avg_transaction_amount,
    ROUND((transaction_amount / avg_transaction_amount), 2) AS spend_multiplier,
    fraud_label
FROM digital_payment_fraud_detection
WHERE transaction_amount > (3 * avg_transaction_amount)
ORDER BY spend_multiplier DESC;


SELECT 
    CASE 
        WHEN account_age_days < 30 THEN 'New Account (<30 Days)'
        WHEN account_age_days BETWEEN 30 AND 365 THEN 'Mid-age Account (1-12 Months)'
        ELSE 'Mature Account (>1 Year)' 
    END AS account_tenure,
    COUNT(*) AS total_transactions,
    SUM(fraud_label) AS total_frauds,
    ROUND((SUM(fraud_label) / COUNT(*)) * 100, 2) AS fraud_rate
FROM digital_payment_fraud_detection
GROUP BY account_tenure
ORDER BY fraud_rate DESC;


-- Provides a high-level snapshot of the fraud rate
CREATE OR REPLACE VIEW vw_overall_fraud_rate AS
SELECT 
    COUNT(transaction_id) AS total_transactions,
    SUM(fraud_label) AS total_frauds,
    ROUND((SUM(fraud_label) / COUNT(transaction_id)) * 100, 2) AS fraud_percentage
FROM digital_payment_fraud_detection;



-- Compares average and max transaction amounts between legitimate and fraudulent transactions
CREATE OR REPLACE VIEW vw_financial_impact_by_class AS
SELECT 
    CASE WHEN fraud_label = 1 THEN 'Fraud' ELSE 'Legitimate' END AS transaction_status,
    ROUND(AVG(transaction_amount), 2) AS avg_amount,
    MAX(transaction_amount) AS max_amount
FROM digital_payment_fraud_detection
GROUP BY fraud_label;


-- Analyzes fraud rates across different payment modes and transaction types
CREATE OR REPLACE VIEW vw_channel_risk_profile AS
SELECT 
    payment_mode,
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(fraud_label) AS fraud_cases,
    ROUND((SUM(fraud_label) / COUNT(*)) * 100, 2) AS fraud_rate
FROM digital_payment_fraud_detection
GROUP BY payment_mode, transaction_type
ORDER BY fraud_rate DESC;



-- Identifies the cities/locations with the highest volume of fraud
CREATE OR REPLACE VIEW vw_geographical_threat_landscape AS
SELECT 
    device_location,
    COUNT(transaction_id) AS total_transactions,
    SUM(fraud_label) AS total_frauds
FROM digital_payment_fraud_detection
GROUP BY device_location
ORDER BY total_frauds DESC;