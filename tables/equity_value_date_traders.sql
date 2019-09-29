drop table equity_value_date_traders
go

create table 
	equity_value_date_traders
(
	trader_id int
)
go

create unique index 
	u_evdt
on
	equity_value_date_traders(trader_id)

go
