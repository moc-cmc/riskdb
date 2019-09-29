
if object_id("theos_queue") != NULL
    drop table
        theos_queue
go

create table
    theos_queue (
        price_id int
    )
go
