
if object_id("channel_login_types") != NULL
    drop table
        channel_login_types
go

create table
    channel_login_types (
        channel_id int,
        login_type_id int
    )
go

create unique index
    u_clt
on
    channel_login_types (
        channel_id,
        login_type_id
    )
go
