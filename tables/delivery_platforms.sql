
if object_id("delivery_platforms") != NULL
    drop table
        delivery_platforms
go

create table
    delivery_platforms (
        delivery_platform_id int identity,
        name varchar(100)
    )
go
