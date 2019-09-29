
if object_id("versions") != NULL
    drop table
        versions
go

create table
    versions (
        version_id int identity,
        name varchar(50),
        version varchar(10)
    )
go

create unique index
    n_v
on
    versions (
        name
    )
go
