
if object_id("product_regions") != NULL
    drop table
        product_regions
go

create table
    product_regions (
        product_region_id int,
        product_id int,
        region_id int
    )
go
