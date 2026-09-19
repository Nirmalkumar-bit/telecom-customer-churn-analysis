-- =========================================
-- Total Customers
-- =========================================
SELECT COUNT(*) AS Total_Customers
FROM dbo.telecome;
-- =========================================
-- Customer Count by Churn Status
-- =========================================
SELECT
    Churn,
    COUNT(*) AS Total_Customers
FROM dbo.telecome
-- =========================================
-- Overall Churn Rate
-- =========================================
SELECT
    CAST(
        ROUND(
            COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome;
-- =========================================
-- Churn Rate by Contract Type
-- =========================================
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
   ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY Contract
ORDER BY Churn_Rate DESC;
-- =========================================
-- Churn Rate by Internet Service
-- =========================================
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY InternetService
ORDER BY Churn_Rate DESC;
-- =========================================
-- Churn Rate by Payment Method
-- =========================================
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;
-- =========================================
-- Churn Rate by Senior Citizen Status
-- =========================================
SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;
-- =========================================
-- Churn Rate by Partner Status
-- =========================================
SELECT
    Partner,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY Partner
ORDER BY Churn_Rate DESC;
-- =========================================
-- Churn Rate by Dependents Status
-- =========================================
SELECT
    Dependents,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY Dependents
ORDER BY Churn_Rate DESC;
-- =========================================
-- Average Tenure by Churn Status
-- =========================================
SELECT
    Churn,
    CAST(ROUND(AVG(CAST(tenure AS DECIMAL(10,2))), 2) AS DECIMAL(10,2)) AS Avg_Tenure
FROM dbo.Telecome
GROUP BY Churn;
-- =========================================
-- Average Monthly Charges by Churn Status
-- =========================================
SELECT
    Churn,
    CAST(
        ROUND(AVG(MonthlyCharges), 2)
        AS DECIMAL(10,2)
    ) AS Avg_Monthly_Charges
FROM dbo.Telecome
GROUP BY Churn;
-- =========================================
-- Average Total Charges by Churn Status
-- =========================================
SELECT
    Churn,
    CAST(
        ROUND(AVG(TotalCharges), 2)
        AS DECIMAL(10,2)
    ) AS Avg_Total_Charges
FROM dbo.Telecome
WHERE TotalCharges IS NOT NULL
GROUP BY Churn;
-- =========================================
-- Churn Rate by Contract Type and Internet Service
-- =========================================
SELECT
    Contract,
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    CAST(
        ROUND(
            SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS DECIMAL(5,2)
    ) AS Churn_Rate
FROM dbo.Telecome
GROUP BY Contract, InternetService
ORDER BY Churn_Rate DESC;
-- =========================================
-- Revenue Analysis by Contract Type--
-- =========================================
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    CAST(ROUND(SUM(TotalCharges),2) AS DECIMAL(12,2)) AS Total_Revenue,
    CAST(ROUND(AVG(TotalCharges),2) AS DECIMAL(10,2)) AS Avg_Revenue_Per_Customer
FROM dbo.Telecome
WHERE TotalCharges IS NOT NULL
ORDER BY Total_Revenue DESC;
-- =========================================
-- Contribution of Each Contract Type to Total Churn
-- =========================================
SELECT
    Contract,
    COUNT(*) AS Churned_Customers,
    CAST(
        ROUND(
            COUNT(*) * 100.0 /
            (SELECT COUNT(*) FROM dbo.Telecome WHERE Churn = 'Yes'),
            2
        ) AS DECIMAL(5,2)
    ) AS Percentage_of_Total_Churn
FROM dbo.Telecome
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY Percentage_of_Total_Churn DESC;