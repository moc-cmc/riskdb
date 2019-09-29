
if object_id("group_channels") != NULL
    drop table
        group_channels
go

create table
    group_channels (
        group_id int,
        channel_id int
    )
go

create unique index
    u_gc
on
    group_channels (
        group_id,
        channel_id
    )
go


