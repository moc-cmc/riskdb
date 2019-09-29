
if object_id("adaptor_contracts") != NULL
    drop table
        adaptor_contracts
go

create table
    adaptor_contracts (
        adaptor_contract_id int,
        contract_id int,
        perspective_contract_id int,
        broker_id int,
        price_scale int,
        price_tick_size float
    )
go
