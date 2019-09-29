drop table
	transaction_logs
go

create table
	transaction_logs(
		transaction_log_id int identity,
		settled_by int,
		external_account_id int,
		status_id int,
		currency_id int,
		amount float,
		settle_date datetime,
		timestamp datetime)

go

create unique nonclustered index
        n_tl
on
        transaction_logs(transaction_log_id)
go
