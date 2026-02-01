-- Running Total Month by Month
select
	OrderMonth ,
	TotalRevenue ,
	sum(TotalRevenue) over(order by OrderMonth) as RunningTotal
from
	(select
		month(order_date) as OrderMonth ,
		round(sum(total_price) , 2) as TotalRevenue
	from
		Sales
	group by
		month(order_date)) t
order by
	OrderMonth;
