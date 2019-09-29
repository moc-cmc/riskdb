
if object_id("product_rates") != NULL
    drop table
        product_rates
go

create table
    product_rates (
        product_rate_id int,
        product_id int,
        rate_date datetime
    )
go
