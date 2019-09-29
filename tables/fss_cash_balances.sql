use
	risk_jeff
go

drop table
	fss_cash_balances
go

create table
	fss_cash_balances(
		trade_date datetime,
		external_account_id int NULL,
		product_id int NULL,
		opening_balance numeric(30,4) NULL,
		posting numeric(30,4) NULL,
		closing_balance numeric(30,4) NULL,
		rate numeric(30,10) NULL,
		usd_balance numeric(30,4) NULL)
go

create unique index
	u_fcb
on
	fss_cash_balances(
		trade_date,
		external_account_id,
		product_id)
go
	
	
