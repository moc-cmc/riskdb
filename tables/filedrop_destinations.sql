create table
	filedrop_destinations(
		filedrop_destination_id int identity,
		name varchar(50))

go

create unique nonclustered index
	u_did
on
	filedrop_destinations(
		filedrop_destination_id)
go

create unique nonclustered index
        u_n
on
        filedrop_destinations(
                name)
go



