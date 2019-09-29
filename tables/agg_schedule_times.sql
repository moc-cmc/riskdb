drop table agg_schedule_times
go

create table
	agg_schedule_times(
		agg_schedule_id int,
		time varchar(5) /* 24 hr format EST, xx:xx */
	)
go

create nonclustered index
	u_cg
on
	agg_schedule_times(agg_schedule_id)
go

		
