
if object_id("party_types") != NULL
    drop table
        party_types
go

create table
    party_types (
        party_type_id int identity,
        name varchar(25)
    )
go
