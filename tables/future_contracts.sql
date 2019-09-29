
if object_id("future_contracts") != NULL
    drop table
        future_contracts
go

create table
    future_contracts (
        contract_id int,
        future_id int,
        expiration datetime
    )
go
