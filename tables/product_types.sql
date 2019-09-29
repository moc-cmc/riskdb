
if object_id("product_types") != NULL
    drop table
        product_types
go

create table
    product_types (
        product_type_id int,
        name char(20)
    )
go
