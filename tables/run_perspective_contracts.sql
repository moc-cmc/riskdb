
if object_id("run_perspective_contracts") != NULL
    drop table
        run_perspective_contracts
go

create table
    run_perspective_contracts (
        run_id int,
        contract_id int,
        perspective_contract_id int,
        product_id int null
    )
go
