
if object_id("product_rate_symbols") != NULL
    drop table
        product_rate_symbols
go

create table
    product_rate_symbols (
        product_rate_id int,
        source_id int,
        symbol varchar(50)
    )
go
