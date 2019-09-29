
if object_id("groups") != NULL
    drop table
        groups
go

create table
    groups (
        group_id int,
        name char(200)
    )
go
