
if object_id("run_external_accounts") != NULL
    drop table
        run_external_accounts
go

create table
    run_external_accounts (
        run_id int,
        external_account_id int
    )
go
