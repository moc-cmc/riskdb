
if object_id("fund_external_accounts") != NULL
    drop table
        fund_external_accounts
go

create table
    fund_external_accounts (
        fund_id int,
        external_account_id int
    )
go
