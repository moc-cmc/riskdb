use
	risk_vscap
go

drop table
	pl_statement_fund_trades
go

create table
	pl_statement_fund_trades(
		pl_statement_id int,
		trade_id int,
		external_account_id int,
		trade_date datetime,
		quantity numeric(30,4),
		contract_id int,
		value_date datetime,
		price float,
		close_price float,
		p_l float NULL)
go



