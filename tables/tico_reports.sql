
if object_id("tico_reports") != NULL
    drop table
        tico_reports
go

create table
	tico_reports (
		tico_report_id int,
		name varchar(100),
    run_id int,
		proc_name varchar(50),
    filename_tmpl varchar(100), /* "${run} - ${report_type} - ${date}" */
    params_tmpl varchar(150), /* automatic: {login:as_user, run:run, runName:run, asOfDate:date, date:date} */
    report_user_id int,
    status_id int
	)
go

create unique nonclustered index
	u_ir
on
	tico_reports(tico_report_id)
go

create unique nonclustered index
	u_rn
on
	tico_reports(run_id, name)
go

delete from keys where relation = "tico_reports"
insert into keys values("tico_reports", 0)
go

