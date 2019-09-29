use
	risk_rcm
go

drop table
	pl_statement_fx_rates
go

create table
	pl_statement_fx_rates(
		pl_statement_id int,
		display_currency_id int,
		currency_id int,
		open_conversion_rate float NULL,
		close_conversion_rate float NULL)
go

create unique index
	u_psfr
on
	pl_statement_fx_rates(
		pl_statement_id,
		display_currency_id,
		currency_id)
go
	
