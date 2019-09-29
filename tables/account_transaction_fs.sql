Drop table account_transaction_fs
go

Create table account_transaction_fs(
        account_transaction_id int,
        fee_schedule_id int
)
go

create unique nonclustered index u_atf on account_transaction_fs(account_transaction_id,fee_schedule_id)
go
