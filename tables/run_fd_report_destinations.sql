create table
	run_fd_report_destinations(
		run_id int,
		filedrop_report_id int,
    		filedrop_destination_id int)
go

create unique nonclustered index
        u_rfd
on
        run_fd_report_destinations(
		run_id,
		filedrop_report_id,
                filedrop_destination_id)
go
