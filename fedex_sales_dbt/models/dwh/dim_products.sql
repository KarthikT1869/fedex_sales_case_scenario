/* 
This file is for creating a products dimension table
*/


with cte as (

    select distinct 
	sha1(concat(asin, sku)) as product_id,
	asin, 
	sku, 
	style, 
	category, 
	size
from {{source ('sales_dl', 'stg_amazon_sales_report_vw')}}

)

select *
from cte

