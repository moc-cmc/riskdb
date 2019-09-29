
if object_id("default_tally_accounts") != NULL
    drop table
        default_tally_accounts
go

create table
    default_tally_accounts (
        tico_account_id int,
        tally_type_id int,
        internal_account_id int null,
        external_account_id int null,
        trader_id int null,
        strategy_id int null,
        status_id int null,
        broker_id int null,
        counterparty_id int null
    )
go
