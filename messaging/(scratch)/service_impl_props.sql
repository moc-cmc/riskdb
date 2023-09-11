if object_id('service_impl_props') is not NULL
    drop table
        service_impl_props
go

/**
 * The service_impl_props table lists ...
 */
create table
    service_impl_props (
        service_impl_prop_id int identity,
        service_impl_id int,
        name varchar(100),
        datatype varchar(50),
        def_value varchar(100),
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    service_impl_props (
        service_impl_prop_id
    )
go

create unique nonclustered index
    u_name
on
    service_impl_props (
        name
    )
go

if not exists(select * from keys where relation = 'service_impl_props')
    insert into keys values('service_impl_props', 0)
go

if not exists(select * from tables where name = 'service_impl_props')
    insert into tables(name, table_type) values('service_impl_props', 'L')
go