
if object_id() != NULL
    drop table
        dist_list_channel_subs
go

create table 
    dist_list_channel_subs (
        dist_list_channel_sub_id int,
        dist_list_id int,
        channel_id int,
        item_id int NULL, /* for consistency, not used */
        min_priority_id int, /* minimum priority */
        activity_status_id int
    )
go

create unique nonclustered index
    dlcs_u
on
    dist_list_channel_subs (
        dist_list_channel_sub_id
    )
go

if not exists(select * from keys where relation = "dist_list_channel_subs")
	insert into keys values("dist_list_channel_subs", 1)

if not exists(select * from tables where name = "dist_list_channel_subs")
	insert into tables(name, table_type) values("dist_list_channel_subs", "L")

go
