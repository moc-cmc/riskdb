drop table int_rtns_ea_map
go

create table
	int_rtns_ea_map(
		int_rtns_ea_map_id int,
		external_account_id int,
		email varchar(100) NULL,
		trader_name varchar(50) NULL,
		trader_id varchar(25) NULL,
		trader_tcid varchar(25) NULL
)
go

create unique nonclustered index 
	u_ar
on
	int_rtns_ea_map(int_rtns_ea_map_id)
go

create unique nonclustered index
	u_arq
on
	int_rtns_ea_map(external_account_id)
go

insert into keys values("int_rtns_ea_map", 0)
go

	
