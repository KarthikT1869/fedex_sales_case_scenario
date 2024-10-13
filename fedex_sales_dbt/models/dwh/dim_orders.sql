/* 
This file is for creating a orders dimension table
*/


with cte as (

    select distinct `ORDER_ID` as order_id ,  
	order_status, 
	fulfilment, 
	`sales_channel`, 
	`ship_service_level`,
	b2b, 
	`fulfilled_by`
from {{source ('sales_dl', 'stg_amazon_sales_report_vw')}}

)

select *
from cte

