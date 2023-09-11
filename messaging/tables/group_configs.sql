if object_id('group_configs') is not NULL
    drop table
        group_configs
go

/**
 * 
 */
create table
    group_configs (
        group_id int,
        config_id int
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    group_configs (
        group_id,
        config_id
    )
go

if not exists(select * from keys where relation = 'group_configs')
    insert into keys values('group_configs', 0)
go

if not exists(select * from tables where name = 'group_configs')
    insert into tables(name, table_type) values('group_configs', 'L')
go

