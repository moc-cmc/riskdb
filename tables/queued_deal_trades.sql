
if object_id("queued_deal_trades") != NULL
    drop table
        queued_deal_trades
go

create table
    queued_deal_trades (
        deal_id int,
        trade_id int
    )
go
