create table
        archive_dates(
                archive_date_id int,
                archive_date date,
                archive_date_status_id int,
		start_date datetime NULL,
		end_date datetime NULL
)
go

create unique nonclustered index
	u_i
on
	archive_dates(archive_date_id)
go

create unique nonclustered index
	u_d
on
	archive_dates(archive_date)
go

insert into
	keys
values(
	"archive_dates",
	1
)
go



