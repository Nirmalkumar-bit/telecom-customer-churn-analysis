
# Telecom Customer Churn Analysis

## Project Overview
This project analyzes customer churn behavior in a telecom company using SQL and Google Sheets.

The goal is to identify the key factors contributing to customer churn and provide actionable insights for customer retention.

## Tools Used
- SQL Server
- Google Sheets
- Pivot Tables
- Charts & Dashboard

## Dataset
- Telecom Customer Churn Dataset
- Total Customers: 7,043
- Features: Contract Type, Internet Service, Payment Method, Senior Citizen, Partner, Dependents, Monthly Charges, Total Charges, Churn Status, etc.

## Key KPIs
- Total Customers: 7,043
- Churned Customers: 1,869
- Retained Customers: 5,174
- Overall Churn Rate: 26.54%
- Average Monthly Charges: 64.76
## Dashboard

### Overview Dashboard
![Dashboard 1](dashboard_1.png)

### Contract & Service Analysis
![Dashboard 2](dashboard_2.png)

### Customer Demographics Analysis
![Dashboard 3](dashboard_3.png)

## SQL Analysis Performed

### Customer Overview
- Total Customers
- Customer Count by Churn Status
- Overall Churn Rate

### Churn Analysis
- Churn Rate by Contract Type
- Churn Rate by Internet Service
- Churn Rate by Payment Method
- Churn Rate by Senior Citizen
- Churn Rate by Partner Status
- Churn Rate by Dependents

### Revenue Analysis
- Average Monthly Charges by Churn Status
- Average Total Charges by Churn Status
- Revenue by Contract Type

## Key Insights

### Contract Type
- Month-to-Month customers showed the highest churn rate (42.71%).
- Two-Year contract customers had the lowest churn rate (2.83%).

### Internet Service
- Fiber Optic customers had the highest churn rate (41.89%).

### Payment Method
- Electronic Check customers had the highest churn rate (45.29%).

### Customer Demographics
- Senior Citizens showed a churn rate of 41.68%.
- Customers without partners had a churn rate of 32.96%.
- Customers without dependents had a churn rate of 31.28%.

## Business Recommendations
1. Encourage customers to move from Month-to-Month contracts to long-term contracts.
2. Improve service quality and customer support for Fiber Optic users.
3. Investigate issues affecting customers using Electronic Check payments.
4. Create retention campaigns for Senior Citizens and high-risk customer segments.

## Repository Structure

```text
telecom-customer-churn-analysis/
│
├── README.md
├── telecom_analysis.sql
├── telecom_customer_churn.csv
├── dashboard_1.png
├── dashboard_2.png
└── dashboard_3.png
```



## Author
Nirmal Rathod
Data Analyst Portfolio Project
