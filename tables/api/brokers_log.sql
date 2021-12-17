
if object_id("brokers_log") != NULL
	drop table
		brokers_log
go

create table
	brokers_log (
		brokers_log_id int,
		user_static_action_id int,
		broker_id int,
		symbol varchar(25),
		source_id int
         )

create unique index bli on brokers_log (brokers_log_id)
go

insert into keys values ("brokers_log", 0)
go

