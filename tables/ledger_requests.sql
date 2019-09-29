create table
	ledger_requests(
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
		request_date datetime)
go

create unique index
	u_lr
on
	ledger_requests(
		ledger_request_id)
go

insert into
	keys
values(
	"ledger_requests",
	0)
go

