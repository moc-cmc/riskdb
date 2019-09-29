
if object_id("counterparty_symbols") != NULL
    drop table
        counterparty_symbols
go

create table
    counterparty_symbols (
        counterparty_id int,
        source_id int,
        symbol char(100)
    )
go

create unique index u_cs on counterparty_symbols values(source_id, symbol)
go
