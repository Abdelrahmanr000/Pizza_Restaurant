-- Total Pizzas Sold For Each Pizza Category
select
	pizza_category ,
	sum(quantity) as TotalQuantity 
from 
	Sales
group by
	pizza_category
order by
	sum(total_price) desc;



-- Top 5 Best Sellers Pizzas
select top 5
	pizza_name ,
	round(sum(total_price) , 2) as TotalRevenue
from
	Sales
group by
	pizza_name
order by
	sum(total_price) desc;


-- Total Pizzas Sold by Pizza Size
select
	pizza_size ,
	sum(quantity) as TotalOrders
from
	Sales
group by
	pizza_size
order by
	sum(quantity) desc;


-- Hourly Trend for Total Orders
select 
	datepart(Hour , order_time) as OrderHour ,
	count(distinct order_id) as TotalOrders
from 
	Sales
group by
	datepart(Hour , order_time)
order by
	count(distinct order_id) desc;


-- Total Revenue Over Months
select
	datename(month , order_date) as OrderMonth ,
	round(sum(total_price) , 2) as TotalRevenue
from
	Sales
group by
	datename(month , order_date)
order by
	round(sum(total_price) , 2) desc;
