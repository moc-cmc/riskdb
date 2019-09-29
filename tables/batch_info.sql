
drop table
	batch_info
go 

create table
	batch_info(
		batch_id int,
		run_name varchar(50) NULL,
		trade_date datetime NULL,
		value_date datetime NULL)
go


		
