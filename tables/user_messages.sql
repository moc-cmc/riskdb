
if object_id("user_messages") != NULL
    drop table
        user_messages
go

create table
    user_messages (
        user_message_id numeric(30,0),
        account_id int,
        message_id int,
        status_id int
    )
go
