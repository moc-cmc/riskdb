
if object_id("reduction_target_contracts") != NULL
    drop table
        reduction_target_contracts
go

create table
    reduction_target_contracts (
        batch_id int,
        contract_id int
    )
go
