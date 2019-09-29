
if object_id("fund_tico_accounts") != NULL
    drop table
        fund_tico_accounts
go

create table
    fund_tico_accounts (
        fund_id int,
        tico_account_id int,
        priority int
    )
go
