
if object_id("run_internal_accounts") != NULL
    drop table
        run_internal_accounts
go

create table
    run_internal_accounts (
        run_id int,
        internal_account_id int
    )
go
