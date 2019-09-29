
if object_id("tally_types") != NULL
    drop table
        tally_types
go

create table
    tally_types (
        tally_type_id int,
        name varchar(25)
    )
go
