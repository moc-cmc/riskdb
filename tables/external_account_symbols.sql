
if object_id("external_account_symbols") != NULL
    drop table
        external_account_symbols
go

create table
    external_account_symbols (
        external_account_id int,
        source_id int,
        symbol char(100)
    )
go

create unique index u_es on external_account_symbols(source_id, symbol)
go
