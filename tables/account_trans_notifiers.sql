create table
    account_trans_notifiers (
        account_trans_notifier_id int identity,
        source_id int,
        external_account_id int null,
	transaction_type_id int null,
        notification_status_id int,
	notifier_date datetime
    )
go

create unique nonclustered index
	u_i
on
	account_trans_notifiers(account_trans_notifier_id)
go

