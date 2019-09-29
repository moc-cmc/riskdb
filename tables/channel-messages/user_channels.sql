
if object_id("user_channels") != NULL
    drop table
        user_channels
go

create table
    user_channels (
        user_id int,
        channel_id int
    )
go

create unique index
    u_uc
on
    user_channels (
        channel_id,
        user_id
    )
go

