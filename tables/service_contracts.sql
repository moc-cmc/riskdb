
if object_id("service_contracts") != NULL
    drop table
        service_contracts
go

create table
    service_contracts (
        service_contract_id int,
        contract_id int,
        external_process_id int,
        price_scale int,
        price_tick_size float
    )
go
