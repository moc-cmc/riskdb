
if object_id("trade_types") != NULL
    drop table
        trade_types
go

create table
    trade_types (
        trade_type_id int identity,
        name varchar(25)
    )
go
