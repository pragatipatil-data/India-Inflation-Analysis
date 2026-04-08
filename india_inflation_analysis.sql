india_inflation_analysis.sql

--Analysis 1: Overall Inflation Trend
SELECT 
    year,
    overall_inflation_pct,
    food_inflation_pct,
    fuel_inflation_pct
FROM inflation_main
ORDER BY year;

-------Analysis 2: High Inflation Years
SELECT 
    year,
    overall_inflation_pct
FROM inflation_main
ORDER BY overall_inflation_pct DESC
LIMIT 3;

---------Analysis 3:  Purchasing Power Loss

SELECT 
    year,
    value_end AS rupee_value,
    total_loss AS loss_from_2015
FROM purchasing_power
ORDER BY year;

----------Analyis 4:  Category wise Worst Inflation

SELECT 
    category,
    AVG(inflation_pct) AS average_inflation
FROM category_inflation
GROUP BY category
ORDER BY average_inflation DESC;

---------------Analysis 5: COVID Impact (2020-2022)
SELECT 
    year,
    overall_inflation_pct,
    food_inflation_pct,
    fuel_inflation_pct
FROM inflation_main
WHERE year BETWEEN 2020 AND 2022
ORDER BY year;
