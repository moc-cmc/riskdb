
drop table order_trades
go

create table
    order_trades(
        order_id int,
        trade_id int
)
go


create unique nonclustered index 
	u_ot
on
	order_trades(trade_id)
go

create nonclustered index
	n_ot
on
	order_trades(order_id)
go

