drop table
	fund_sub_types
go

create table
	fund_sub_types(
		fund_id int NULL,
		name varchar(50)
	)

go

create unique nonclustered index 
	u_fst
on
	fund_sub_types(fund_id)
go



	 
