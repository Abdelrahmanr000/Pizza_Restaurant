-- Total Revenue
select
	round(sum(total_price) , 2) as TotalRevenue
from
	Sales;


-- Average Order Value (AOV)
select
	round(sum(total_price) / count(distinct order_id) , 2) as AverageOrderValue
from
	Sales;


-- Total Pizzas Sold
select
	sum(quantity) as TotalQuantity
from
	Sales;


-- Total Orders
select 
	count(distinct order_id) as TotalOrders
from
	Sales;


-- Average Pizzas Per Order
select
	round(cast(sum(quantity) as float) / count(distinct order_id) , 2) as AvgPizzasPerOrder
from
	Sales;
