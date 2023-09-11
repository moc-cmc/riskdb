
if object_id('messenger_channel_subs') is not NULL
    drop table
        messenger_channel_subs
go

/**
 * A messenger subscription to a channel, optionally bound to a specific topic, 
 * conversation or other topic. 
 */
create table
    messenger_channel_subs (
        messenger_channel_sub_id int identity,
        channel_id int,
        messenger_id int,
        messenger_topic varchar(100),
        activity_status_id int
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    messenger_channel_subs (
        messenger_channel_sub_id
    )
go

if not exists(select * from keys where relation = 'messenger_channel_subs')
    insert into keys values('messenger_channel_subs', 0)
go

if not exists(select * from tables where name = 'messenger_channel_subs')
    insert into tables(name, table_type) values('messenger_channel_subs', 'L')
go