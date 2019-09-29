use
	risk_rcm
go

drop table
	pl_statement_trades
go

create table
	pl_statement_trades(
		pl_statement_id int,
		trade_id int,
		external_account_id int,
		contract_id int,
		size float NULL,
		currency_id int NULL,
		quantity int,
		price float,
		close_price float NULL,
		native_pl float NULL,
		p_l float NULL,
		product_id int,
		brokerage float NULL,
		fees float NULL,
		comm_amount float NULL,
		delta float NULL)

go


create unique index
	u_pst
on
	pl_statement_trades(
		pl_statement_id,
		trade_id)

go
