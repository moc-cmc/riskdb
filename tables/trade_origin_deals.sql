
if object_id("trade_origin_deals") != NULL
    drop table
        trade_origin_deals
go

create table
    trade_origin_deals (
        trade_id int,
        deal_id int
    )
go
