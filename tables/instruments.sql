
if object_id("instruments") != NULL
    drop table
        instruments
go

create table
    instruments (
        instrument_id int,
        name char(100)
    )
go
