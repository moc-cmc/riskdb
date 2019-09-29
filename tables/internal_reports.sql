drop table internal_reports
go

create table
	internal_reports
(
	internal_report_id int,
	name varchar(50),
	procedure_name varchar(50)=NULL
)
go

create unique nonclustered index
	u_ir
on
	internal_reports(internal_report_id)
go

create unique nonclustered index
	u_n
on
	internal_reports(name)
go

insert into keys values("internal_reports", 0)
go

