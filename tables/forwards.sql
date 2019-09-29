
if object_id("forwards") != NULL
    drop table
        forwards
go

create table
    forwards (
        contract_id int,
        currency_id int,
        product_id int,
        quantity int,
        exchange_id int
    )
go
