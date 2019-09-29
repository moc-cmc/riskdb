use
	risk_edgewater_test
go

drop table
	batch_netting_trades
go

create table
	batch_netting_trades(
		batch_id int,
		trade_id int,
		agg_group_id int,
		status_id int)
go

create unique index
	u_bnt
on
	batch_netting_trades(
		trade_id)

go
