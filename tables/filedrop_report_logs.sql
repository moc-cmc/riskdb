create table
	filedrop_report_logs(
		filedrop_report_id int,
		run_id int,
		filedrop_destination_id int,
		capture_date datetime,
		filename varchar(100))

go

create unique nonclustered index
	u_frdt
on
	filedrop_report_logs(
		filedrop_report_id,
		run_id,
		filedrop_destination_id,
		filename)
go



