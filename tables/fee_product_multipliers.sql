
drop table
	fee_product_multipliers
go

create table
	fee_product_multipliers(
		fee_schedule_id int,
		product_id int,
		multiplier numeric(30,8))
go

create unique index
	u_fpm
on
	fee_product_multipliers(
		fee_schedule_id,
		product_id)
go



