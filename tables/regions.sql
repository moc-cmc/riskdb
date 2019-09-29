
if object_id("regions") != NULL
    drop table
        regions
go

create table
    regions (
        region_id int,
        name char(20)
    )
go
