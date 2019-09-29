
drop table
	open_trades
go

create table
	open_trades(
		id int,
		trade_date datetime,
		trade_id int,
		external_account_id int,
		contract_id int,
		value_date datetime,
		open_amount numeric(30,4),
		price float,
		current_price float NULL,
		currency_id int NULL,
		unrealized_pl float NULL)
	
go

create unique index
	u_ot
on
	open_trades(
		id)

create unique index
	n_ot
on
	open_trades(
		trade_id)

create nonclustered index
	n_ott
on
	open_trades(trade_date)
go

create nonclustered index
	n_ote
on
	open_trades(external_account_id)
go


delete

from
	keys
where
	relation = "open_trades"

insert into
	keys
values(
	"open_trades",
	0)
go

