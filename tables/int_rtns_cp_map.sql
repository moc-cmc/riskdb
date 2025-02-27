drop table int_rtns_cp_map
go

create table
	int_rtns_cp_map(
		int_rtns_cp_map_id int,
		counterparty_id int,
		email varchar(100) NULL,
		trader_name varchar(50) NULL,
		trader_id varchar(25) NULL,
		trader_tcid varchar(25) NULL
)
go

create unique nonclustered index 
	u_ar
on
	int_rtns_cp_map(int_rtns_cp_map_id)
go

create unique nonclustered index
	u_arq
on
	int_rtns_cp_map(counterparty_id)
go

insert into keys values("int_rtns_cp_map", 0)
go

	
