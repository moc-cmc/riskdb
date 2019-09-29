
if object_id("default_accounts") != NULL
    drop table
        default_accounts
go

create table
    default_accounts (
        tico_account_id int,
        spot_internal_account_id int,
        spot_external_account_id int,
        futures_internal_account_id int,
        futures_external_account_id int,
        internal_external_account_id int
    )
go
