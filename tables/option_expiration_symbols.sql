
if object_id("option_expiration_symbols") != NULL
    drop table
        option_expiration_symbols
go

create table
    option_expiration_symbols (
        option_expiration_id int,
        source_id int,
        symbol char(200)
    )
go
