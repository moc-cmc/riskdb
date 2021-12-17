
if object_id("user_runs_log") != NULL
begin
	drop table
		user_runs_log
	delete from
		keys 
	where
		relation="user_runs_log"
end
go

create table
	user_runs_log (
		user_runs_log_id int,
		user_static_action_id int,
		user_id int,
		run_id int
         )

create unique index urli on user_runs_log (user_runs_log_id)
go


insert into keys values ("user_runs_log", 0)
go

