-- Total Orders Over Day Periods 
with day_period as (
select
	case when datepart(hour , order_time) between 9 and 14 then 'Morning'
		 when datepart(hour , order_time) between 15 and 19 then 'Lunch & Afternoon'
		 else 'Dinner & Night'
	end as DayPeriod ,
	order_id 
from
	Sales
)
-- Main Query
select
	DayPeriod ,
	count(distinct order_id) as TotalOrders
from
	day_period
group by
	DayPeriod
order by
	count(distinct order_id) desc;
