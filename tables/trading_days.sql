
if object_id("trading_days") != NULL
    drop table
        trading_days
go

create table
    trading_days (
        trading_day_id numeric(10,0) identity,
        trade_date datetime
    )
go
