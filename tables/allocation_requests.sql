use
	risk_sjm_dev
go

drop table
	allocation_requests
go

create table
	allocation_requests(
		allocation_request_id int,
		requestor_id int,
		status_id int,
		fo_sub_account_id int,
		product_id int,
		amount float,
		request_date datetime,
		respond_timestamp datetime NULL)

go

create unique index
	u_ar
on
	allocation_requests(
		allocation_request_id)

delete

from
	keys
where
	relation = "allocation_requests"
go

insert into
	keys
values(
	"allocation_requests",
	0)
go

