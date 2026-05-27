select * from walmart_cleaned

/**view column name**/
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'walmart_cleaned';

/*Total Sales*/
SELECT ROUND(SUM(weekly_sales)::numeric, 2) AS total_sales
FROM walmart_cleaned;

/*Average Weekly Sales*/
SELECT ROUND(AVG(weekly_sales)::numeric, 2) AS average_sales
FROM walmart_cleaned;

/*Best Stores*/
SELECT store,
       ROUND(SUM(weekly_sales)::numeric, 2) AS total_sales
FROM walmart_cleaned
GROUP BY store
ORDER BY total_sales desc

/*Monthly Sales Trend*/
SELECT month,
       ROUND(SUM(weekly_sales)::numeric, 2) AS total_sales
FROM walmart_cleaned
GROUP BY month
ORDER BY total_sales DESC;
LIMIT 10;

/*Holiday vs Non-Holiday Sales*/
SELECT holiday_flag,
       ROUND(SUM(weekly_sales)::numeric, 2) AS total_sales
FROM walmart_cleaned
GROUP BY holiday_flag;

/*Highest Weekly Sale*/
SELECT MAX(weekly_sales) AS highest_sale
FROM walmart_cleaned;

/*Lowest Weekly Sale*/
SELECT MIN(weekly_sales) AS lowest_sale
FROM walmart_cleaned;

/*Average Fuel Price*/
SELECT ROUND(AVG(fuel_price)::numeric, 2) AS avg_fuel_price
FROM walmart_cleaned;

/*Average Unemployment Rate*/
SELECT ROUND(AVG(unemployment)::numeric, 2) AS avg_unemployment
FROM walmart_cleaned;

/*Sales Category Analysis*/
SELECT sales_category,
       COUNT(*) AS total_records
FROM walmart_cleaned
GROUP BY sales_category;

/*Best Sales Month*/
SELECT month,
       ROUND(SUM(weekly_sales)::numeric, 2) AS total_sales
FROM walmart_cleaned
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;

/*Store Count*/
SELECT COUNT(DISTINCT store) AS total_stores
FROM walmart_cleaned;