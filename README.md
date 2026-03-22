# 🍕 Pizza Sales Data Analysis (SQL + Power BI)

## 📌 Project Overview

This project analyzes pizza sales data using **PostgreSQL** and visualizes insights using **Power BI**.
The goal is to uncover key business insights such as revenue trends, customer behavior, and best-selling products.

---

## 📊 Key KPIs

* 💰 Total Revenue
* 🧾 Average Order Value (AOV)
* 🍕 Total Pizzas Sold
* 📦 Total Orders

---

## 🧮 SQL Analysis Performed

### 1. Total Revenue

```sql
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
```

### 2. Average Order Value (AOV)

```sql
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AOV FROM pizza_sales;
```

### 3. Daily Trend of Orders

```sql
SELECT 
   EXTRACT(DOW FROM order_date) AS DOW,
   TO_CHAR(order_date,'Day') AS day,
   COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DOW, day
ORDER BY DOW;
```

### 4. Monthly Trend

```sql
SELECT 
    EXTRACT(MONTH FROM order_date) AS month_num,
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY month_num, month_name
ORDER BY month_num;
```

### 5. Sales by Category (%)

```sql
SELECT pizza_category,
       SUM(total_price) AS total_sales,
       SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS pct
FROM pizza_sales
GROUP BY pizza_category;
```

### 6. Top 5 Best Sellers

```sql
SELECT pizza_name, SUM(quantity) AS pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY pizza_sold DESC
LIMIT 5;
```

---

## 📈 Dashboard (Power BI)

The dashboard includes:

* Revenue trends
* Sales by category & size
* Top & bottom selling pizzas
* Order patterns by day & month

---

## 🛠 Tools Used

* SQL (PostgreSQL)
* Power BI
* Excel

---

## 🚀 Key Insights

* Peak sales days identified
* Most popular pizza categories and sizes
* Top-performing and underperforming products
* Monthly sales trends for business planning

---

## 📎 Files Included

* Dataset (Excel)
* SQL queries
* Power BI dashboard

---

## ⭐ How to Use

1. Import dataset into PostgreSQL
2. Run SQL queries from `pizza_analysis.sql`
3. Open Power BI file to explore dashboard


