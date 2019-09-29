
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

create unique index
    ga_ga
on
    group_accounts (
        group_id,
        tico_account_id
    )
go
