
if object_id("futures") != NULL
    drop table
        futures
go

create table
    futures (
        future_id int,
        forward_id int,
        name char(25),
        root_symbol varchar(50),
        exchange_id int,
        quantity float,
        tick_size float,
        future_type_id int null
    )
go
