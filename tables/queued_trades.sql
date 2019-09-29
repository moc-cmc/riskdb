
drop table
	queued_trades
go

create table
	queued_trades(
		queued_trade_id int,
		queued_deal_id int,
		batch_id int,
		user_id int,
		trade_date datetime,
		tally_type_id int,
		contract_id int,
		value_date datetime,
		quantity numeric(30,4),
		price float,
		external_account_id int,
		internal_account_id int,
		counterparty_id int,
		trader_id int,
		strategy_id int,
		broker_id int,
		identifier varchar(100) NULL,
		trade_type_id int NULL)
go

create unique clustered index
	u_qt
on
	queued_trades(
		queued_trade_id)
go

delete

from
	keys
where
	relation = "queued_trades"

insert into
	keys
values(
	"queued_trades",
	0)
go
