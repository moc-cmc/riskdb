
if object_id("bo_prices") != NULL
    drop table
        bo_prices
go

create table
    bo_prices (
        bo_price_id int,
        status_id int,
        contract_id int,
        price_date datetime,
        value_date datetime null,
        source_id int,
        price float
    )
go
