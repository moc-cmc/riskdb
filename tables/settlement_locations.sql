drop table settlement_locations
go

create table
	settlement_locations(
		settlement_location_id int identity,
		name varchar(50),
		org_id int NULL
)
go

create unique nonclustered index 
	u_s
on
	settlement_locations(settlement_location_id)
go

create unique nonclustered index 
        u_sn
on
        settlement_locations(name)
go

