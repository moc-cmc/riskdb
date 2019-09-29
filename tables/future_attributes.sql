
if object_id("future_attributes") != NULL
    drop table
        future_attributes
go

create table
    future_attributes (
        future_id int,
        attribute_type_id int,
        value char(100)
    )
go
