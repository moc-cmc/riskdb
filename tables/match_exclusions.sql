
if object_id("match_exclusions") != NULL
    drop table
        match_exclusions
go

create table
    match_exclusions (
        match_exclusion_id int identity,
        source_id int,
        external_account_id int null,
        broker_id int null,
	trader_id int null,
	counterparty_id int null,
        status_id int null,
        trade_type_id int null,
        match_status_id int NULL,
        matching_engine_id int NULL
    )
go
