
if object_id("trade_notifiers") != NULL
    drop table
        trade_notifiers
go

create table
    trade_notifiers (
        trade_notifier_id int identity,
        source_id int,
        external_account_id int null,
        broker_id int null,
	trader_id int null,
	counterparty_id int null,
        status_id int null,
        notification_status_id int,
	notifier_date datetime
    )
go
