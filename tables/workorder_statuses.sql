
create table 
	workorder_statuses (
		workorder_status_id	int,
		name			varchar(25))

go

create unique index wsi on workorder_statuses (workorder_status_id)
go

create unique index wsn on workorder_statuses (name)
go

insert into workorder_statuses values (1, "Pending")
insert into workorder_statuses values (2, "Sent")
insert into workorder_statuses values (3, "Signed")
insert into workorder_statuses values (4, "Rejected")
insert into workorder_statuses values (5, "Terminated")
go

insert into
	keys
values(
	"workorder_statuses",
	6)

go

