if object_id("external_account_directions") != NULL
    drop table
	external_account_directions
go

create table
	external_account_directions (
		external_account_id int,
		direction int
)
go

create unique nonclustered index 
	u_ea 
on 
	external_account_directions(external_account_id)
go
