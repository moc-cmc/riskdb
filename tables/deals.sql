
if object_id("deals") != NULL
    drop table
        deals
go

create table
    deals (
        deal_id int,
        deal_type_id int,
        timestamp datetime,
        status_id int
    )
go
