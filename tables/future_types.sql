
if object_id("future_types") != NULL
    drop table
        future_types
go

create table
    future_types (
        future_type_id int,
        name varchar(50)
    )
go
