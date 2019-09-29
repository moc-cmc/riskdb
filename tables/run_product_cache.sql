
if object_id("run_product_cache") != NULL
    drop table
        run_product_cache
go

create table
    run_product_cache (
        run_id int,
        date datetime,
        product_id int,
        quantity numeric(30,0)
    )
go
