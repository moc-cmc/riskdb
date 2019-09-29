create table 
	system_wipe_identifiers(
		id int identity,
		tico_account_id int,
		identifier varchar(50),
		timestamp datetime
)


create unique nonclustered index 
	pk
on
	system_wipe_identifiers(id)
go

create unique nonclustered index 
	nk
on
	system_wipe_identifiers(identifier)
go
		
