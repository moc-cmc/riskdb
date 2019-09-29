
if object_id("prices") != NULL
    drop table
        prices
go

create table
    prices (
        price_id int,
        status_id int,
        contract_id int,
        price_date datetime,
        price_type_id int,
        price float
    )
go
