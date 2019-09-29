use
	risk_cc
go

drop table
	ext_account_biproduct_rates
go

create table
	ext_account_biproduct_rates(
		external_account_id int,
		contract_id int,
		closing_date datetime,
		closing_rate float NULL,
		roll_date datetime NULL,
		roll_rate float NULL,
		trade_date datetime NULL)

create nonclustered index 
	u_e 
on
	ext_account_biproduct_rates(external_account_id)

go
