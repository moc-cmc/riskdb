
if object_id("future_symbols") != NULL
    drop table
        future_symbols
go

create table
    future_symbols (
        future_id int null,
        source_id int,
        symbol char(75)
    )
go
