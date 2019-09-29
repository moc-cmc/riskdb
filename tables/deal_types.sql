
if object_id("deal_types") != NULL
    drop table
        deal_types
go

create table
    deal_types (
        deal_type_id int identity,
        name varchar(50)
    )
go
