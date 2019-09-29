
drop table
	queued_trade_value_dates
go

create table
	queued_trade_value_dates(
		queued_trade_id int,
		value_date datetime)
go

create unique clustered index
	u_tvd
on
	queued_trade_value_dates(
		queued_trade_id)
go
