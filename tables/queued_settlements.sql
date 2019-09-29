drop table
	queued_settlements
go

create table
	queued_settlements(
		id int identity,
		batch_id int,
		transaction_date datetime,
		external_account_id int,
		product_id int,
		quantity numeric(30,2))
go



