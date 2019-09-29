
if object_id("int_account_transactions") != NULL
    drop table
        int_account_transactions
go

create table
    int_account_transactions (
        int_account_transaction_id int,
        entered_by int,
        internal_account_id int,
        transaction_type_id int,
        transaction_date datetime,
        amount float,
        note char(255) null
    )
go
