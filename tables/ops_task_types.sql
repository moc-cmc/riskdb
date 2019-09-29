
create table
        ops_task_types
(
        ops_task_type_id int,
        name varchar(30)
)
go

create unique nonclustered index
	u_ott
on
	ops_task_types(ops_task_type_id)
go

create unique nonclustered index 
        n_ott
on
        ops_task_types(name)
go

insert into ops_task_types values(1, "Back Office")
insert into ops_task_types values(2, "Middle Office")
insert into ops_task_types values(3, "Front Office")
go

insert into keys values("ops_task_types", 3)
go



