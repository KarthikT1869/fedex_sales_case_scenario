/* 
This file is for creating a order_line fact table
*/


with cte as (

    select row_id ,  
	order_id , 
	order_date, 
	sha1(concat(asin, sku)) as product_id, 
	sha1(concat(`ship_city`, `ship_state`, `ship_postal_code`, `ship_country`)) as address_id, 
	qty, 
	currency, 
	amount
from {{source ('sales_dl', 'stg_amazon_sales_report_vw')}}

)

select *
from cte

