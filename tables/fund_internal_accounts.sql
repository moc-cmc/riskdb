
if object_id("fund_internal_accounts") != NULL
    drop table
        fund_internal_accounts
go

create table
    fund_internal_accounts (
        fund_id int,
        internal_account_id int
    )
go
