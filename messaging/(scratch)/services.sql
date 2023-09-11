if object_id('services') is not NULL
    drop table
        services
go

/**
 * The services table lists ...
 */
create table
    services (
        service_id int identity,
        name varchar(100),
        provider_id int,
        service_impl_id int,
    )
with
    identity_gap = 5
go

create unique nonclustered index
    u_id
on
    services (
        service_id
    )
go

create unique nonclustered index
    u_name
on
    services (
        name
    )
go

if not exists(select * from keys where relation = 'services')
    insert into keys values('services', 0)
go

if not exists(select * from tables where name = 'services')
    insert into tables(name, table_type) values('services', 'L')
go