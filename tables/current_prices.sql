
if object_id("current_prices") != NULL
    drop table
        current_prices
go

create table
    current_prices (
        contract_id int,
        price float,
        timestamp datetime
    )
go
