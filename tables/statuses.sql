
if object_id("statuses") != NULL
    drop table
        statuses
go

create table
    statuses (
        status_id int,
        name char(100)
    )
go
