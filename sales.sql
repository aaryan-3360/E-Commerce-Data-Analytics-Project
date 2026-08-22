create database sales;
use sales;
SELECT 
    *
FROM
    sales.Dataset;
SELECT 
    COUNT(*)
FROM
    sales.Dataset;
SELECT 
    *
FROM
    sales.dataset
LIMIT 10;

-- 1. Top 10 profitable products
SELECT product_name, ROUND(SUM(profit), 2) AS total_profit
FROM Dataset
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- 2. top 10 customers by sale 
SELECT customer_name, ROUND(SUM(sales), 2) AS total_sales
FROM sales.Dataset
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 3.Region-wise total sales
SELECT region, SUM(sales) AS total_sales
FROM sales.dataset
GROUP BY region
ORDER BY total_sales DESC;

-- 4.Categeory wise average profit
SELECT category, ROUND(AVG(profit), 2) AS average_profit
FROM sales.dataset
GROUP BY category
ORDER BY average_profit DESC;

-- 5.Highest discount category
SELECT category, ROUND(AVG(discount), 2) AS average_discount
FROM sales.dataset
GROUP BY category
ORDER BY average_discount DESC
LIMIT 1;

-- 6.Orders with negative profit
SELECT order_id, product_name, profit
FROM sales.dataset
WHERE profit < 0
ORDER BY profit;

-- 7. Monthly sales trend 
SELECT 
    SUBSTR(order_date, 3, 7) AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM sales.dataset
GROUP BY SUBSTR(order_date, 3, 7)
ORDER BY month;

-- 8. Market-wise revenue analysis
SELECT market,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales.dataset
GROUP BY market
ORDER BY total_revenue DESC;

-- 9. top performing sub-categories
SELECT 
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales.dataset
GROUP BY sub_category
ORDER BY total_profit DESC;

-- 10. ship mode using analysis
SELECT 
    ship_mode,
    COUNT(*) AS orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(sales), 2) AS avg_sales
FROM sales.dataset
GROUP BY ship_mode
ORDER BY total_sales DESC;


SELECT 
  ship_mode,
  COUNT(*) as order_count
  from sales.dataset
  group by ship_mode
  order by order_count desc ;
  
