
if object_id("channels") != NULL
    drop table
        channels
go

create table
    channels (
        channel_id int identity,
        name varchar(50),
        item_relation_id int NULL
    )
go
