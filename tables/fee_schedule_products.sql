use
	risk_jeff
go

drop table
	fee_schedule_products
go

create table
	fee_schedule_products(
		fee_schedule_id int,
		product_id int,
		multiplier float,
		min_size float)
go
