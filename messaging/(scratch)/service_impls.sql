if object_id('service_impls') is not NULL
    drop table
        service_impls
go

/**
 * The service_impls table lists ...
 */
create table
    service_impls (
        service_impl_id int identity,
        name varchar(100),
        impl varchar(100),
        service_type_id int,
        parent_impl_id int,
        
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    service_impls (
        service_impl_id
    )
go

create unique nonclustered index
    u_name
on
    service_impls (
        name
    )
go

if not exists(select * from keys where relation = 'service_impls')
    insert into keys values('service_impls', 0)
go

if not exists(select * from tables where name = 'service_impls')
    insert into tables(name, table_type) values('service_impls', 'L')
go