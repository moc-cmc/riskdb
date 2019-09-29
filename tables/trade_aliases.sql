
if object_id("trade_aliases") != NULL
    drop table
        trade_aliases
go

create table
    trade_aliases (
        trade_id int,
        source_id int,
        alias varchar(100)
    )
go
