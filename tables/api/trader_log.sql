
if object_id("trader_log") != NULL
	drop table
		trader_log
go

create table
	trader_log (
		trader_log_id int,
		user_static_action_id int,
		trader_id int,
		symbol varchar(50) NULL,
		tico_account_id int NULL,
		default_strategy_id int NULL,
		external_account_id int NULL,
		sales_code_id int NULL
         )

create unique index tli on trader_log (trader_log_id)
go

insert into keys values ("trader_log", 0)
go

