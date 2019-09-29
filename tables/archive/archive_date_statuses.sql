create table
	archive_date_statuses(
		archive_date_status_id int,
		name varchar(15) 
)
go

insert into archive_date_statuses values(1, "Pending")
insert into archive_date_statuses values(2, "In Progress")
insert into archive_date_statuses values(3, "Complete")
insert into archive_date_statuses values(4, "Failed")
go

create unique nonclustered index 
	u_i
on
	archive_date_statuses(archive_date_status_id)
go

create unique nonclustered index
	u_in
on
	archive_date_statuses(name)
go

insert into
	keys
values(
	"archive_date_statuses",
	5
)
go

