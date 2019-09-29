
if object_id("channels") != NULL
    drop table
        channels
go

create table
    channels (
        channel_id int,
        name varchar(100),
        item_relation_id int NULL,
        item_id int NULL,
        activity_status_id int
    )
go

create unique index
    u_c
on
    channels (
        channel_id
    )
go

create unique index
    n_c
on
    channels (
        name
    )
go

insert into channels values(1, "Admin", NULL, NULL, 1)

delete from keys where relation = "channels"
insert into keys(relation, last_id) values("channels", 1)

go
