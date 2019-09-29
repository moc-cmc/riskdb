
if object_id("current_product_rates") != NULL
    drop table
        current_product_rates
go

create table
    current_product_rates (
        product_rate_id int,
        product_id int
    )
go
