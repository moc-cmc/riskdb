
create table
	ops_task_statuses(
		ops_task_status_id int,	
		name varchar(25)
)
go

create unique nonclustered index
	u_dc
on
	ops_task_statuses(ops_task_status_id)
go

create unique nonclustered index 
        u_dcd
on
        ops_task_statuses(name)
go

delete from 
	keys
where
	relation="ops_task_statuses"

insert into ops_task_statuses values(1, "Pending")
insert into ops_task_statuses values(2, "Complete")
go


insert into 
	keys
values(
	"ops_task_statuses",
        2
)
go



			
