create table
	filedrop_reports(
		filedrop_report_id int identity,
		name varchar(50))

go

create unique nonclustered index
	u_fdrid
on
	filedrop_reports(
		filedrop_report_id)
go

create unique nonclustered index
        u_n
on
        filedrop_reports(
                name)
go



