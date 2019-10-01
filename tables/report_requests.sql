create table
	report_requests(
		report_request_id int,
		internal_report_id int,
		request_status_id int,
		requested_by int,
		requested_at datetime,
		parameters varchar(100) NULL
)
go

create unique nonclustered index
	pk
on
	report_requests(report_request_id)
go

create nonclustered index 
	n_rr
on
	report_requests(internal_report_id, request_status_id)
go

insert into keys values("report_requests", 0)
go
