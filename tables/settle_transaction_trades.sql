create table
	settle_transaction_trades(
		settle_transaction_trade_id int identity,
		trade_id int,
		product_transaction_id int,
		currency_transaction_id int,
		settled_at datetime
)

create unique nonclustered index 
	pk
on
	settle_transaction_trades(settle_transaction_trade_id)
go

create unique nonclustered index
	nk
on
	settle_transaction_trades(trade_id)
go


if not exists(select name from tables where name = "settle_transaction_trades")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"settle_transaction_trades",
		"J"
	)
end
go

