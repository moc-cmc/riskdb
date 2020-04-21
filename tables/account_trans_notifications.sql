create table
	account_trans_notifications(
		account_trans_notification_id int identity,
		source_id int,
		account_transaction_id int,
		status_id int,
		capture_date datetime,
		notify_date datetime NULL
)
go

create unique nonclustered index
	u_i
on
	account_trans_notifications(account_trans_notification_id)
go

create unique nonclustered index
	u_is
on
	account_trans_notifications(source_id, account_transaction_id)
go



exec r_settablestable "account_trans_notifications", "J"
go
