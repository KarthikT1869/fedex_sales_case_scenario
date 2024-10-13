/* 
This file is for creating a date dimension table
*/


with cte as (

    select distinct order_date,  
	dayofmonth(order_date) as day_num,  
	month(order_date) as month_num, 
	year(order_date) as year_num, 
	dayname(order_date) as day_name, 
	monthname(order_date) as month_name 
from {{source ('sales_dl', 'stg_amazon_sales_report_vw')}}

)

select *
from cte

