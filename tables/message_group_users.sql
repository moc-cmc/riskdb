
if object_id("message_group_users") != NULL
    drop table
        message_group_users
go

create table
    message_group_users (
        message_group_id int,
        user_id int
    )
go
