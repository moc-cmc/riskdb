use
	risk_edgewater
go

drop table
	open_futures
go

create table
	open_futures(
		trade_id int,
		settle_date datetime,
		remaining numeric(30,4),
		settle float NULL,
		unrealized_pl float NULL,
		status_id int,
		equiv float NULL)
go

create unique index
	n_of
on
	open_futures(
		trade_id,
		settle_date)
go

