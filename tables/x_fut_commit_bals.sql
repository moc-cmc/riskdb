drop table
	x_fut_commit_bals
go
	
create existing table
	x_fut_commit_bals(
		external_account_id int NULL,
		contract_id int NULL,
		longs float NULL,
		avg_long float NULL, 
		shorts float NULL,
		avg_short float NULL,
		open_pos float NULL,
		avg_open float NULL,
		closed_pos float NULL,
		product_id int NULL,
		currency_id int NULL,
		multiplier float NULL,
		realized_pl float NULL,
		unrealized_pl float NULL,
		last_price float NULL,
		_login varchar(50) NULL,
		_legal_entity varchar(50) NULL,
		_account varchar(50) NULL,
		_trade_date datetime NULL)

external procedure at
	'loopback.risk_laser..api_futcommitbals'
go 
