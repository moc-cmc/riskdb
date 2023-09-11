if object_id('config_schemas') is not NULL
    drop table
        config_schemas
go

/**
 * The config_schemas table lists ...
 */
create table
    config_schemas (
        config_schema_id int identity,
        name varchar(100),            -- includes version
        impl_tag varchar(100),        -- Implementation tag, 
        parent_type_id int NULL,      -- parent version 
        subject_table_id int NULL,    -- 
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    config_schemas (
        config_schema_id
    )
go

create unique nonclustered index
    u_name
on
    config_schemas (
        name
    )
go

if not exists(select * from keys where relation = 'config_schemas')
    insert into keys values('config_schemas', 0)
go

if not exists(select * from tables where name = 'config_schemas')
    insert into tables(name, table_type) values('config_schemas', 'L')
go