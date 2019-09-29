create table
	liquidity_stream_eb_trades(
		eb_trade_id int, /*primary key*/
		market_pb_trade_id int
)
go

create unique nonclustered index 
	pk 
on
	liquidity_stream_eb_trades(eb_trade_id)

create unique nonclustered index 
	nk 
on
	liquidity_stream_eb_trades(market_pb_trade_id, eb_trade_id)
go


	
	
		
