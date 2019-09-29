
if object_id("internal_accounts") != NULL
    drop table
        internal_accounts
go

create table
    internal_accounts (
        internal_account_id int,
        symbol char(100),
        name char(255),
        default_external_account_id int
    )
go
