
if object_id("message_recipients") != NULL
    drop table
        message_recipients
go

create table
    message_recipients (
        message_recipient_id int identity,
        user_id int,
        address varchar(100),
        delivery_method_id int,
        status_id int /* Pending, Active */
    )
go
