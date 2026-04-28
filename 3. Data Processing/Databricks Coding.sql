select * 
from `workspace`.`data`.`bright_car_sales`;


-- CREATE CLEANED DATASET
-- This step prepares the raw data for analysis
CREATE OR REPLACE VIEW bright_car_sales_cleaned AS
SELECT
    year,
    make,
    model,
    trim,
    body,
    transmission,
    vin,
    state,

    -- Handle missing condition values (NULL → 0)
    COALESCE(CAST(condition AS INT), 0) AS vehicle_condition,

    odometer,
    color,

    -- Fix invalid or missing interior values
    CASE
        WHEN interior IS NULL OR TRIM(interior) = '' OR interior = 'â€"' THEN 'Unknown'
        ELSE interior
    END AS interior,

    seller,
    mmr,
    sellingprice,

    -- Convert sale date from text to timestamp
    to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss') AS sale_timestamp,
    
    -- Extract year and month for trend analysis
    YEAR(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss')) AS sale_year,
    MONTH(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss')) AS sale_month,

    -- Profit calculation (MMR used as cost proxy)
CASE 
  WHEN (sellingprice - mmr) < 0 THEN 0
  ELSE (sellingprice - mmr)
END AS profit,

    -- Profit margin percentage
    ROUND(((sellingprice - mmr) / sellingprice) * 100, 2) AS profit_margin,

    -- Categorize performance based on profit margin
    CASE
        WHEN ((sellingprice - mmr) / sellingprice) * 100 > 10 THEN 'High Margin'
        WHEN ((sellingprice - mmr) / sellingprice) * 100 BETWEEN 5 AND 10 THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS performance_tier

FROM (
    -- Remove ONLY exact duplicate records
    -- Same VIN but different mileage or price is kept
    SELECT
           year,
           make,
           model,
           trim,
           body,
           transmission,
           vin,
           state,
           condition,
           odometer,
           color,
           interior,
           seller,
           mmr,
           sellingprice,
           saledate,
           ROW_NUMBER() OVER (
               PARTITION BY
                   vin,
                   year,
                   make,
                   model,
                   trim,
                   body,
                   transmission,
                   state,
                   condition,
                   odometer,
                   color,
                   interior,
                   seller,
                   mmr,
                   sellingprice,
                   saledate
               ORDER BY saledate DESC
           ) AS rn
    FROM `workspace`.`data`.`bright_car_sales`

) t
WHERE rn = 1;


-- FINAL ANALYSIS QUERY
-- This dataset is used for dashboard & reporting
SELECT
    make,
    model,
    body,
    transmission,
    state,
    sale_year,
    sale_month,
    performance_tier,

    -- Number of cars sold
    COUNT(*) AS units_sold,

    -- Total revenue generated
    SUM(sellingprice) AS total_revenue,

    -- Total profit
    SUM(profit) AS total_profit,

    -- Average selling price
    ROUND(AVG(sellingprice), 2) AS avg_price,

    -- Average profit margin
ROUND((SUM(profit) / SUM(sellingprice)) * 100, 2) AS avg_profit_margin,

    -- Average mileage (useful for analysis)
    ROUND(AVG(odometer), 2) AS avg_mileage

FROM bright_car_sales_cleaned

-- Grouping for analysis dimensions
GROUP BY
    make,
    model,
    body,
    transmission,
    state,
    sale_year,
    sale_month,
    performance_tier

-- Show highest revenue first
ORDER BY total_revenue DESC;
