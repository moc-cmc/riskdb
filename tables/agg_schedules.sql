drop table agg_schedules
go

create table
	agg_schedules(
		agg_schedule_id int,
		name varchar(50)
	)
go

create unique nonclustered index
	u_cg
on
	agg_schedules(agg_schedule_id)
go

create unique nonclustered index 
        u_cgn
on
        agg_schedules(name)
go 

insert into keys values("agg_schedules", 1)
go
		
