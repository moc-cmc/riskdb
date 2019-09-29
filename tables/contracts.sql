
if object_id("contracts") != NULL
    drop table
        contracts
go

create table
    contracts (
        contract_id int,
        symbol char(50),
        instrument_id int
    )
go
