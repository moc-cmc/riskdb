use
	risk_home
go

if object_id("account_transaction_edits") != NULL
    drop procedure
        account_transaction_edits
go

create table
    account_transaction_edits (
        account_transaction_id int,
        entered_by int,
        external_account_id int,
        transaction_type_id int,
        transaction_date datetime,
        amount float,
        note char(255) null,
        archive_date datetime,
        tico_account_id int
    )
go
