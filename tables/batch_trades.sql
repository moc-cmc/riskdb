
drop table
	batch_trades
go

create table
	batch_trades(
		batch_id int,
		trade_id int,
		deal_id int,
		user_id int,
		trade_type_id int,
		internal_account_id int,
		external_account_id int,
		counterparty_id int,
		quantity numeric(30,14),
		contract_id int,
		value_date datetime,
		fixing_date datetime,
		price float,
		trade_date datetime,
		trader_id int,
		strategy_id int,
		status_id int,
		broker_id int,
		sales_code_id int,
		identifier varchar(50),
		pct_price numeric(30,14),
		spot_reference float NULL)
go

create unique clustered index
	u_t
on
	batch_trades(
		trade_id)
go

insert into
	keys
values(
	"batch_trades",
	0)
go
