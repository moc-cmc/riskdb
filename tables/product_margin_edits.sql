
drop table
	product_margin_edits
go

create table
	product_margin_edits(
		tico_account_id int,
		timestamp datetime,
		product_id int,
		margin float,
		prime_broker_id int)
go



