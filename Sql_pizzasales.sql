create database Pizza_DB;
use Pizza_DB;

--Total Revenue of pizza sales--
select SUM(total_price) as Total_Revenue from pizza_sales;
select * from pizza_sales;

-- Average order value --

select (SUM(total_price)/ COUNT(distinct order_id)) as Avg_order_value  from pizza_sales;

-- Total pizza Sold --

select SUM(quantity) as Total_pizza_sold from pizza_sales;

-- Total orders by customers--

select count(distinct order_id) as Total_orders from pizza_sales;

--Average Pizza per order--

select CAST(CAST(SUM(quantity) as decimal(10,2))/ CAST(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Average_Pizza_per_oder from pizza_sales;

--order by weekdays--

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- order by months--

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

-- percentage by category--

select pizza_category, CAST(sum(total_price) as decimal(10,2)) as Total_Revenue,
SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales where MONTH(order_date)=1)  AS PCT
from pizza_sales
where MONTH(order_date)=1
group by pizza_category;

--. % of Sales by Pizza Size--
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

--Total Pizzas Sold by Pizza Category--

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

--Top 5 Pizzas by Revenue--

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

--Bottom 5 Pizzas by Revenue--

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Top 5 Pizzas by Quantity--

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--Bottom 5 Pizzas by Quantity--

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold;

--Top 5 Pizzas by Total Orders--

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Borrom 5 Pizzas by Total Orders--

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders;






