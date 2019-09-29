use
	risk_ram
go

drop table
	session_working_opt_exp
go

create table
	session_working_opt_exp(
		session_id varchar(100),
		option_expiration_id int NULL,
		trade_date datetime NULL)
go



		
