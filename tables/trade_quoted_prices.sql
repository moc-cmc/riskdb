drop table
	trade_quoted_prices
go

create table
	trade_quoted_prices(
		trade_id int,
		price float)

go

create unique clustered index u_tqp on trade_quoted_prices(trade_id)
go
