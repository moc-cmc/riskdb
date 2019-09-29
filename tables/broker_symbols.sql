
if object_id("broker_symbols") != NULL
    drop table
        broker_symbols
go

create table
    broker_symbols (
        broker_id int,
        source_id int,
        symbol char(100)
    )
go
