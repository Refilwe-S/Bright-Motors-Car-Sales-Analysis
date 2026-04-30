#   Bright Motors Car Sales Analysis

##  Business Problem

Bright Motors needs better visibility into its **sales performance, profitability, and customer preferences** to:

* Maximize revenue
* Improve pricing strategy
* Identify high-performing vehicles
* Reduce losses

This project uses data to uncover **actionable insights that support business growth and decision-making**.

---

##  Project Objective

To clean, analyze, and visualize car sales data in order to:

* Improve data quality and consistency
* Identify trends and profitability drivers
* Understand customer preferences
* Support data-driven business decisions

---

##  Dataset Overview

The dataset contains car sales transactions including:

* Vehicle make & model
* Body type (SUV, Sedan, etc.)
* Transmission type
* Selling price
* MMR (market value)
* Mileage
* Sale date

---

##  Tools & Technologies

* Databricks (SQL) – Data cleaning & analysis
* Excel / – Dashboard creation
* Looker Studio – Reporting dashboards
* Lovable – Interactive dashboard
* GitHub – Documentation

---

##  Data Cleaning & Preparation

The dataset was cleaned and transformed using SQL:

* Handled NULL values using `COALESCE`
* Standardized invalid characters (e.g. 'â€”')
* Converted sale dates into proper format
* Removed duplicate records using `ROW_NUMBER()`
* Created calculated fields:

  * Profit
  * Profit Margin
  * Performance Tier

---

##  Project Planning

###  Workflow (Miro Flowchart)

 [View Miro Flowchart](./2.%20Project%20Planning/Miro%20Flowchart.pdf)

###  Project Timeline (Gantt Chart)

 [View Gantt Chart](./2.%20Project%20Planning/Gantt%20Chart.png)

---

##  Live Dashboards

### Bright Motors (Lovable Dashboard)

 https://bright-motor-sales-report.lovable.app

---

### Bright Motors (Looker Studio – Dashboard)

https://datastudio.google.com/s/vOYaybAPY1k

---

 **Note:**

* Lovable dashboard provides an **interactive web-based experience**
* Looker Studio dashboards provide **detailed analytical reporting**

---

## Key Analysis

### Sales Trends

* Monthly and yearly performance analysis
* Revenue growth patterns

###  Product Performance

* Revenue by make, model, and body type
* Identification of top-performing vehicles

###  Profitability Analysis

* Total profit and margin evaluation
* Identification of loss-making sales

### Customer Preferences

* Popular body types (SUV vs Sedan)
* Transmission trends

### Pricing & Mileage Insights

* Lower mileage vehicles tend to sell at higher prices
* Pricing significantly influences demand

---

## Key Metrics

* Units Sold (transaction count)
* Total Revenue
* Total Profit
* Profit Margin (%)
* Average Price & Mileage

---

## Key Insights

*  High-end vehicles generate the most revenue
*  Some vehicles are sold below market value (MMR)
*  SUVs and Sedans dominate sales
*  Lower mileage vehicles command higher prices

---

## Business Recommendations

## Improve Profitability

* Focus on high-margin vehicles
* Avoid underpricing below MMR

## Optimize Inventory

* Increase stock for high-demand vehicles
* Reduce low-performing inventory

## Pricing Strategy

* Align pricing with market value
* Continuously monitor pricing trends

## Growth Opportunities

* Expand into high-performing regions
* Use data insights to guide expansion

---

## How to Run

```sql
-- Example: Remove duplicates
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY vehicle_id ORDER BY sale_date) AS rn
    FROM sales_data
) t
WHERE rn = 1;
```

Run queries in **Databricks SQL** to reproduce the analysis.

---

## Project Structure

```
  Bright-Motors-Car-Sales-Analysis
│
├── 1. Project Description & Raw Data
│   └── Raw Data
│   └─  Project Description
├── 2. Project Planning
│   ├── Miro Flowchart.pdf
│   └── Gantt Chart.png
│
├── 3. Data Processing
│   ├── SQL/
│   │   └── bright_motors_analysis.sql
│   └── Excel/
│       └── analysis.xlsx
│
├── 4. Project Presentation
│   ├── Dashboard/
│   │   ├── dashboard.png
│   │   └── dashboard 
│  
│
└── README.md
```



---

## Project Output

* Cleaned dataset
* SQL queries
* Interactive dashboards
* Business insights & recommendations

---

## Author

**Refilwe Sebako**

Certified Virtual Assistant | Executive Assistant | 10+ Years Admin & Operations Experience | Customer Service | E-commerce | Data Analyst

LinkedIn: https://www.linkedin.com/in/resebako

---

## Portfolio Value

This project demonstrates:

* SQL data cleaning and transformation
* Business-focused analysis
* Dashboard development
* Translating data into actionable insights

---

## Conclusion

This project shows how raw car sales data can be transformed into **meaningful insights that drive smarter business decisions and improve performance**.
