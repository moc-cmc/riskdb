
if object_id("exchanges") != NULL
    drop table
        exchanges
go

create table
    exchanges (
        exchange_id int,
        name char(50)
    )
go
