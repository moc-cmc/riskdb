
if object_id("def_perspective_contracts") != NULL
    drop table
        def_perspective_contracts
go

create table
    def_perspective_contracts (
        contract_id int,
        perspective_contract_id int,
        product_id int null
    )
go
