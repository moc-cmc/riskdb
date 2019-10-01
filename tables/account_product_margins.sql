drop table
	account_product_margins
go

create table
	account_product_margins(
		product_id int,
		margin float,
		external_account_id int)
go

create unique index
	u_pm
on
	account_product_margins(
		product_id,
		external_account_id)
go


