-- Compare Each Product Sales With Average Sales
with pizza_sales as (
select
	pizza_name ,
	round(sum(total_price) , 2) as TotalRevenue 
from
	Sales
group by
	pizza_name
)
, intermediate_cte as (
select
	* ,
	round(avg(TotalRevenue) over() , 2) as AveragePerProduct ,
	round(TotalRevenue - round(avg(TotalRevenue) over() , 2) , 2) as AvgDiff ,
	case when TotalRevenue - round(avg(TotalRevenue) over() , 2) > 0 then 'Above Average'
		 else 'Below Average'
	end as AvgCategory
from 
	pizza_sales
)
-- Main Query
select
	AvgCategory ,
	count(*) as CategoryCount
from
	intermediate_cte
group by
	AvgCategory
order by
	count(*) desc;
