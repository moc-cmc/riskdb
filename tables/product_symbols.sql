
if object_id("product_symbols") != NULL
    drop table
        product_symbols
go

create table
    product_symbols (
        product_id int null,
        source_id int,
        symbol char(75)
    )
go
