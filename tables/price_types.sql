
if object_id("price_types") != NULL
    drop table
        price_types
go

create table
    price_types (
        price_type_id int,
        name char(255)
    )
go
