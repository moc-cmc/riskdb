
if object_id("trader_symbols") != NULL
    drop table
        trader_symbols
go

create table
    trader_symbols (
        trader_id int,
        source_id int,
        symbol char(50)
    )
go

create unique index u_ts on trader_symbols(source_id, symbol)
go

