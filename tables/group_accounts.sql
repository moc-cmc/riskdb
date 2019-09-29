
if object_id("group_accounts") != NULL
    drop table
        group_accounts
go

create table
    group_accounts (
        group_id int,
        tico_account_id int
    )
go
