
if object_id("current_product_rate_points") != NULL
    drop table
        current_product_rate_points
go

create table
    current_product_rate_points (
        product_rate_id int,
        days float,
        rate float
    )
go
