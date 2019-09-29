
if object_id("exotic_instruments") != NULL
    drop table
        exotic_instruments
go

create table
    exotic_instruments (
        exotic_instrument_id int,
        symbol char(10),
        name char(100)
    )
go
