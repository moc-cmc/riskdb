use
	risk_stater_dev
go

drop table
	credit_positions
go

create table
	credit_positions(
		external_account_id int,
		product_id int,
		balance numeric(30,4),
		equiv numeric(30,4),
		margin_rate float,
		long_equiv float,
		short_equiv float,
		trade_date datetime)
go

create unique index
	u_cp
on
	credit_positions(
		external_account_id,
		product_id,
		margin_rate,
		trade_date)

go
