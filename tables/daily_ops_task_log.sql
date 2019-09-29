
create table
        daily_ops_task_logs(
		daily_ops_task_logs_id int identity,
                daily_ops_task_id int,
                ops_task_status_id int,
                user_id int NULL,
                timestamp datetime NULL
)
go

create unique nonclustered index 
	u_dot
on
	daily_ops_task_logs(daily_ops_task_logs_id)
go

create nonclustered index 
	n_dot
on
	daily_ops_task_logs(daily_ops_task_id)
go

