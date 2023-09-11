if object_id('messengers') is not NULL
    drop table
        messengers
go

/**
 * The messengers table lists ...
 */
create table
    messengers (
        messenger_id int identity,
        name varchar(100),
        provider_id int,
        activity_status_id int
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    messengers (
        messenger_id
    )
go

create unique nonclustered index
    u_name
on
    messengers (
        name
    )
go

if not exists(select * from keys where relation = 'messengers')
    insert into keys values('messengers', 0)
go

if not exists(select * from tables where name = 'messengers')
    insert into tables(name, table_type) values('messengers', 'L')
go