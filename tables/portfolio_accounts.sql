
if object_id("portfolio_accounts") != NULL
    drop table
        portfolio_accounts
go

create table
    portfolio_accounts (
        portfolio_id int,
        internal_account_id int
    )
go
