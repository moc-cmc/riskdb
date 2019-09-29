
if object_id("delivery_platforms") != NULL
    drop table
        delivery_platforms
go

/* table deprecated */

delete from keys where relation = "delivery_platforms"
go

