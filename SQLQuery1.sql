select sum(total_price) as Total_Revenue from pizza_sales

select * from pizza_sales

select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_Orders from pizza_sales

select CAST(CAST(sum(quantity) as decimal(10,2)) / 
CAST(count (distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order from pizza_sales

select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(DW, order_date)

select DATENAME(month, order_date) as month_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(month, order_date)
order by Total_Orders Desc

select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as Percentage_total_sales
from pizza_sales 
where MONTH(order_date) = 1
group by pizza_category

select pizza_size, CAST(sum(total_price) as decimal(10,2)) as Total_sales, CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where DATEPART(quarter, order_date) = 1) as decimal(10,2))  as Percentage_total_sales
from pizza_sales
where DATEPART(quarter, order_date) = 1
group by pizza_size
order by Percentage_total_sales desc

select Top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
Order by Total_Revenue Desc

select Top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
Order by Total_Revenue Asc

select Top 5 pizza_name, count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
Order by Total_Orders Asc

select Top 5 pizza_name, sum(quantity) as Total_Orders
from pizza_sales
where MONTH (order_date) = 8
group by pizza_name
order by Total_Orders Asc