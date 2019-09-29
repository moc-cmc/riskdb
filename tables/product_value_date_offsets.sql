
if object_id("product_value_date_offsets") != NULL
    drop table
        product_value_date_offsets
go

create table
    product_value_date_offsets (
        product_id int,
        offset_days int
    )
go
