
if object_id("sales_code_log") != NULL
	drop table
		sales_code_log
go

create table
	sales_code_log (
		sales_code_log_id int,
		user_static_action_id int,
		sales_code_id int,
		name varchar(25) 
         )

create unique index sli on sales_code_log (sales_code_log_id)
go

insert into keys values ("sales_code_log", 0)
go

