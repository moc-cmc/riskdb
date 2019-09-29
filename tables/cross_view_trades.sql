
if object_id("cross_view_trades") != NULL
    drop table
        cross_view_trades
go

create table
    cross_view_trades (
        trade_id int
    )
go
