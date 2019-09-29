
if object_id("committed_pl_products") != NULL
    drop table
        committed_pl_products
go

create table
    committed_pl_products (
        int_account_transaction_id int,
        product_id int,
        balance_pl float
    )
go
