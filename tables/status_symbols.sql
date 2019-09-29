
if object_id("status_symbols") != NULL
    drop table
        status_symbols
go

create table
    status_symbols (
        status_id int,
        name varchar(25),
        status_symbol varchar(15)
    )
go
