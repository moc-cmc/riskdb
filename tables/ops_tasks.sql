
create table
	ops_tasks
(
	ops_task_id int,
	name varchar(100),
	ops_task_type_id int,
	ordering int,
	status_id int,
	assigned_to int NULL,
	create_date datetime
)
go

create unique nonclustered index
	u_ot
on
	ops_tasks(ops_task_id)
go

create unique nonclustered index
	n_ot
on
	ops_tasks(name, ops_task_type_id, ordering)
go


insert into keys values("ops_tasks", 0)
go




		
		
