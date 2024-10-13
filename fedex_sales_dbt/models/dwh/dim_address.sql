/* 
This file is for creating a address dimension table
*/


with cte as (

    select distinct sha1(concat(`ship_city`, `ship_state`, `ship_postal_code`, `ship_country`)) as address_id, 
	`ship_city`, 
	`ship_state`, 
	`ship_postal_code`, `ship_country`
from {{source ('sales_dl', 'stg_amazon_sales_report_vw')}}

)

select *
from cte

