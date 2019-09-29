use
	risk_untl
go

drop table
	source_aggregate_trades
go

create table
	source_aggregate_trades(
		sat_id int,
		net_ticket_batch_id int,
		source_id int,
		trade_date datetime,
		folder_id int,
		sub_folder_id int,
		strategy_id int,
		contract_id int,
		value_date datetime,
		quantity numeric(30,4),
		price float)
go

create unique index
	u_sat
on
	source_aggregate_trades(
		sat_id)
go

delete

from
	keys
where
	relation = "source_aggregate_trades"
go

insert into
	keys
values(
	"source_aggregate_trades",
	0)
go

		
