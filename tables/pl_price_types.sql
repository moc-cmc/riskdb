
if object_id("pl_price_types") != NULL
    drop table
        pl_price_types
go

create table
    pl_price_types (
        pl_price_type_id int,
        name char(100)
    )
go
