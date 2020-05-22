create table
	risk_class_requests(
		risk_class_request_id int,
		requested_by int,
		requested_at datetime,
		risk_class_id int,
		trade_date datetime,
		status_id int,
		started_at datetime NULL,
		completed_at datetime NULL
)

create unique nonclustered index
	pk
on
	risk_class_requests(risk_class_request_id)
go

create unique nonclustered index
        u_nk
on
	risk_class_requests(risk_class_id, trade_date, status_id)
go

create nonclustered index
        n_st
on
        risk_class_requests(status_id)
go


exec r_settablestable "risk_class_requests", "J"
go

insert into keys values("risk_class_requests", 1)
go
