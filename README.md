# Bright-Motors-Car-Sales-Analysis

**Project Overview**

This project focuses on analyzing car sales data for Bright Motors to uncover key business insights, improve decision-making, and identify opportunities for growth.

The analysis includes data cleaning, transformation, and aggregation using SQL, followed by visualization through a dashboard.

**Objectives**

Clean and prepare raw sales data
Handle missing and inconsistent values
Remove exact duplicate records
Analyze sales performance and profitability
Identify trends and customer preferences
Provide data-driven business recommendations

**Tools & Technologies**
Databricks (SQL)
Power BI / Excel (Dashboard)
GitHub
Lovable Live Dashboard

**Data Cleaning & Preparation**

The raw dataset was processed to ensure data quality:

NULL values handled using COALESCE
Invalid values (e.g. 'â€”') standardized
Sale date converted into usable date format
Exact duplicate records removed using ROW_NUMBER()
New calculated fields created (profit, profit margin, performance tier)

**Key Analysis**

The following analyses were performed:

Sales trends by month and year
Revenue by make, model, and body type
Profitability analysis (profit & margin)
Customer preferences (SUV vs Sedan, transmission types)
Mileage vs pricing insights

**Key Metrics**

Units Sold = Count of transactions
Total Revenue = Sum of selling price
Total Profit = Selling price − MMR
Profit Margin (%)
Average Price & Mileage

**Insights**
High-end vehicles generate the most revenue
Some vehicles are sold below market value (MMR)
SUVs and Sedans dominate sales
Lower mileage vehicles tend to sell at higher prices

**Recommendations**

Focus on high-margin vehicles
Improve pricing strategy to avoid losses
Increase inventory for high-demand vehicle types
Expand into additional regions


**Project Structure**
├── SQL/
│   └── bright_motors_analysis.sql
├── Dashboard/
│   └── dashboard.pbix / excel.xlsx
├── README.md

**Output**

**Cleaned dataset**
SQL analysis queries
Interactive dashboard
Business insights & recommendations

**Conclusion**

This project demonstrates how raw data can be transformed into meaningful insights that support business decision-making through structured data analysis and visualization.


Author: Refilwe Sebako
Role: Data Analyst / Virtual Assistant
