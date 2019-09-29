create table
	ledger_request_edits(
		ledger_request_id int,
		requestor_id int,
		status_id int,
		outside_account_id int,
		bo_master_account_id int,
		custodial_account_id int NULL,
		ledger_request_type_id int,
		product_id int,
		amount float,
		transaction_date datetime,
		request_date datetime,
		edited_by int,
		timestamp datetime)
go

create unique nonclustered index
	pk
on
	ledger_request_edits(ledger_request_id)
go
