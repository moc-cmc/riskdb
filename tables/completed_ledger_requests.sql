use
	risk_sjmdemo
go

drop table
	completed_ledger_requests
go

create table
	completed_ledger_requests(
		ledger_request_id int,
		requestor_id int,
		ledger_request_type_id int,
		product_id int,
		amount float,
		transaction_date datetime,
		request_date datetime)
go

create unique index
	u_lr
on
	completed_ledger_requests(
		ledger_request_id)
go
