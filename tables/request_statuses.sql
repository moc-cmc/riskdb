create table
	request_statuses(
		request_status_id int,	
		name varchar(25)
)
go

create unique nonclustered index
	u_dc
on
	request_statuses(request_status_id)
go

create unique nonclustered index 
        u_dcd
on
        request_statuses(name)
go

delete from 
	keys
where
	relation="request_statuses"

insert into request_statuses values(1, "Requested")
insert into request_statuses values(2, "Pending")
insert into request_statuses values(3, "Complete")
insert into request_statuses values(4, "Failed")

insert into 
	keys
values(
	"request_statuses",
        4	
	)
go
