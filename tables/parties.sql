drop table parties
go

create table
	parties(
		party_id int identity,
		name varchar(50), 
		party_type_id int,
		pb_party_id int NULL,
		settlement_location_id int NULL
	)
go

create unique nonclustered index 
	u_p
on
	parties(party_id)
go

