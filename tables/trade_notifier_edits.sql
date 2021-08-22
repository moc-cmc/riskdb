create table
    trade_notifier_edits (
        trade_notifier_id int,
        source_id int,
        external_account_id int null,
        broker_id int null,
	trader_id int null,
	counterparty_id int null,
        status_id int null,
        notification_status_id int,
	notifier_date datetime,
	edited_by int,
	timestamp datetime
    )
go

create unique nonclustered index 
	pk
on
	trade_notifier_edits(trade_notifier_id)
go

create nonclustered index
	tne_t
on
	trade_notifier_edits(timestamp)
go

