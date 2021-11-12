
if object_id("user_static_actions") != NULL
	drop table
		user_static_actions
go

create table
	user_static_actions (
		user_static_action_id int,
		user_id int, 
		static_action_id int, 
		table_name varchar(50),
		timestamp datetime
	)
go

create index ui on user_static_actions (user_id) 
go

insert into keys values ("user_static_actions", 0)
go


