
if object_id("delivery_methods") != NULL
    drop table
        delivery_methods
go

/* table deprecated */

delete from keys where relation = "delivery_methods"
go

