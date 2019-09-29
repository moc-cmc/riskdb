
if object_id("product_rate_points") != NULL
    drop table
        product_rate_points
go

create table
    product_rate_points (
        product_rate_id int,
        days float,
        rate float
    )
go
