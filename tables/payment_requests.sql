use
	risk_stad
go

drop table
	payment_requests
go

create table
	payment_requests(
		payment_request_id int,
		submitted_by int,
		timestamp datetime,
		payer_account_id int,
		payee_account_id int,
		amount numeric(30,4),
		product_id int,
		status_id int)
go

create unique index
	u_pr
on
	payment_requests(
		payment_request_id)
go

delete

from
	keys
where
	relation = "payment_requests"
go

insert into
	keys
values(
	"payment_requests",
	0)
go
