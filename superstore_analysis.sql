
-- SUPERSTORE SALES ANALYSIS
-- Analyst: Pragati Patil
-- Date: April 2025

-- Analysis 1: Overall Performance
SELECT
    COUNT(DISTINCT order_id)    AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(sales)                  AS total_sales,
    SUM(profit)                 AS total_profit
FROM superstore;

-- Analysis 2: Region wise Performance
SELECT
    region,
    COUNT(DISTINCT order_id)    AS total_orders,
    SUM(sales)                  AS total_sales,
    SUM(profit)                 AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Analysis 3: Category wise Performance
SELECT
    category,
    sub_category,
    SUM(sales)   AS total_sales,
    SUM(profit)  AS total_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- Analysis 4: Top 10 Customers
SELECT
    customer_id,
    segment,
    COUNT(DISTINCT order_id)  AS total_orders,
    SUM(sales)                AS total_sales,
    SUM(profit)               AS total_profit
FROM superstore
GROUP BY customer_id, segment
ORDER BY total_sales DESC
LIMIT 10;

-- Analysis 5: Discount Impact
SELECT
    CASE
        WHEN discount = 0    THEN 'No Discount'
        WHEN discount <= 0.2 THEN 'Low Discount'
        WHEN discount <= 0.4 THEN 'Medium Discount'
        ELSE                      'High Discount'
    END          AS discount_type,
    COUNT(*)     AS total_orders,
    SUM(sales)   AS total_sales,
    SUM(profit)  AS total_profit
FROM superstore
GROUP BY discount_type
ORDER BY total_profit DESC;


