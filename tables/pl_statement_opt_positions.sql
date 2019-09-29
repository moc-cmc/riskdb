use
	risk_vscap
go

drop table
	pl_statement_opt_positions
go

create table
	pl_statement_opt_positions(
		pl_statement_id int,
		trade_id int,
		external_account_id int,
		contract_id int,
		value_date datetime NULL,
		quantity numeric(30,4),
		product_id int NULL,
		begin_price float NULL,
		end_price float NULL,
		begin_value float NULL,
		begin_usd float NULL,
		end_value float NULL,
		end_usd float NULL)

go

create unique index
	u_psop
on
	pl_statement_opt_positions(
		pl_statement_id,
		trade_id)
go
