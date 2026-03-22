SELECT * FROM pizza_Sales;

-- kpi's 
-- 1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_Sales;

-- 2. AOV (Average Order Value)
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AOV FROM pizza_Sales;

-- 3. Total pizzas sold
SELECT SUM(quantity) AS Pizza_sold FROM pizza_Sales;

-- 4. Total Orders
SELECT SUM(DISTINCT order_id) AS total_orders FROM pizza_Sales;

-- Data Analysis
-- 1. Daily Trend for Total Orders
SELECT 
   EXTRACT(DOW FROM order_date) AS DOW ,
   TO_CHAR(order_date,'Day'),
   COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY EXTRACT(DOW FROM order_date) , TO_CHAR(order_date,'Day')
ORDER BY EXTRACT(DOW FROM order_date);

-- 2. Monthly Trend for Total Orders
SELECT 
    EXTRACT(MONTH FROM order_date) AS month_num,
    TO_CHAR(order_date, 'Month') AS month_name,
	COUNT(DISTINCT order_id)
FROM pizza_sales
GROUP BY 
    EXTRACT(MONTH FROM order_date),
    TO_CHAR(order_date, 'Month')
ORDER BY month_num;

-- 3. percentage of sales by pizza category
SELECT pizza_category , SUM(total_price) AS Total_Sales,SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- 4. percentage of sales by pizza size
SELECT pizza_size , SUM(total_price) AS Total_Sales , SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct;

-- 5. Total pizzas sold by pizza category
SELECT pizza_category , SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;

-- 6. Top 5 Best Sellers by pizzas sold
SELECT pizza_name , SUM(quantity) AS pizza_sold
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY pizza_sold DESC
LIMIT 5;

-- 7. Bottom 5 Worst Sellers by Total pizzas sold
SELECT pizza_name , SUM(quantity) AS pizza_sold
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY pizza_sold ASC
LIMIT 5;