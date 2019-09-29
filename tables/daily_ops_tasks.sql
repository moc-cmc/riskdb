
create table
        daily_ops_tasks(
                daily_ops_task_id int identity,
                ops_task_id int,
                trade_date date,
                ops_task_status_id int,
                user_id int NULL,
                timestamp datetime NULL
)
go

create unique nonclustered index 
	u_dot
on
	daily_ops_tasks(daily_ops_task_id)
go



create unique nonclustered index 
	n_dot
on
	daily_ops_tasks(trade_date, ops_task_id)
go

