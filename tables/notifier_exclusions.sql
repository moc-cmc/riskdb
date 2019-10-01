create table
    notifier_exclusions (
        notifier_exclusion_id int identity,
        source_id int,
        external_account_id int null,
        broker_id int null,
	trader_id int null,
	counterparty_id int null,
        status_id int null,
        trade_type_id int null
    )
go
