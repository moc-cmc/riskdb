
if object_id("account_transactions") != NULL
    drop table
        account_transactions
go

create table
    account_transactions (
        account_transaction_id int,
        entered_by int,
        external_account_id int,
        transaction_type_id int,
        transaction_date datetime,
        currency_id int,
        amount float,
        note char(255) null
    )
go

create nonclustered index n_at on account_transactions(external_account_id)
go

create nonclustered index n_atd on account_transactions(transaction_date)
go

create unique nonclustered index u_at on account_transactions(account_transaction_id)
go

create nonclustered index n_c on account_transactions(currency_id)
go
