
if object_id("order_types") != NULL
    drop table
        order_types
go

create table
    order_types (
        order_type_id int,
        name char(20)
    )
go
