
if object_id("trade_prices") != NULL
    drop table
        trade_prices
go

create table
    trade_prices (
        trade_id int,
        price float,
        timestamp datetime
    )
go
