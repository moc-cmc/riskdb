if object_id("swap_symbol_trades") != NULL
    drop table
        swap_symbol_trades
go


create table
   swap_symbol_trades (
	swap_symbol_id int,
	trade_id int
   )
go

create unique nonclustered index u_ss on swap_symbol_trades(swap_symbol_id, trade_id)
go




