
if object_id("message_groups") != NULL
    drop table
        message_groups
go

create table
    message_groups (
        message_group_id numeric(30,0) identity,
        name varchar(50),
        status_id int
    )
go
