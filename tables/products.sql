
if object_id("products") != NULL
    drop table
        products
go

create table
    products (
        product_id int,
        product_type_id int,
        symbol char(20),
        name char(100),
        decimal_precision int NULL
    )
go
