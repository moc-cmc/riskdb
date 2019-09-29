
if object_id("match_notifiers") != NULL
    drop table
        match_notifiers
go

create table
	match_notifiers(
		match_notifier_id int identity,
		source_id int,
		external_account_id int NULL,
		broker_id int NULL,
		trader_id int NULL,
		counterparty_id int NULL,
		status_id int NULL,
		notification_status_id int,
		notifier_date datetime,
		trade_type_id int NULL,
		match_status_id int NULL,
		matching_engine_id int NULL
)

go
