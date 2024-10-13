/* 
This file is for creating a staging view for amazon_sales_report from Raw data table
*/


with cte as (

    select 
	cast(`index` as unsigned integer) as Row_ID,
	`Order ID` as Order_ID,
	str_to_date(`Date`, '%m-%d-%y') as Order_Date,
	`Status` as Order_Status,
	Fulfilment ,
	`Sales Channel`  as Sales_Channel,
	`ship-service-level` as ship_service_level,
	Style ,
	SKU ,
	Category ,
	Size ,
	ASIN ,
	`Courier Status` as Courier_Status,
	ifnull(cast(qty as unsigned int),0) as Qty ,
	currency ,
	IF(amount='',NULL,CAST(amount as decimal(8,2))) as Amount ,
	`ship-city` as ship_city,
	`ship-state` as ship_state,
	`ship-postal-code` as ship_postal_code,
	`ship-country` as ship_country,
	`promotion-ids` as promotion_ids,
	B2B ,
	`fulfilled-by` as fulfilled_by,
	`Unnamed: 22` as Unnamed_22
from {{source ('sales_dl', 'amazon_sales_report')}}

)

select *
from cte

