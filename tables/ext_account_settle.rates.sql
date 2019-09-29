use
	risk_tradenext_test
go

drop table
	ext_account_settle_rates
go

create table
	ext_account_settle_rates(
		external_account_id int,
		product_id int,
		closing_date datetime,
		closing_rate float NULL,
		roll_date datetime NULL,
		roll_rate float NULL)

go
