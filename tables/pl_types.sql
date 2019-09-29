
if object_id("pl_types") != NULL
    drop table
        pl_types
go

create table
    pl_types (
        pl_type_id int,
        name char(200)
    )
go
