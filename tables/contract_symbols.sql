
if object_id("contract_symbols") != NULL
    drop table
        contract_symbols
go

create table
    contract_symbols (
        contract_id int,
        source_id int,
        symbol char(100)
    )
go
