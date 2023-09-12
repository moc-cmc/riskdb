drop table
	roll_trade_dates
go

create table
	roll_trade_dates(
		trade_date datetime,
		validated_by int NULL,
		timestamp datetime NULL)

go
		
create unique index
	u_rtd
on
	roll_trade_dates(
		trade_date)
go
