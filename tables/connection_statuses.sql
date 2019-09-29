
create table
	connection_statuses(
		connection_status_id int,	
		name varchar(25)
)
go

create unique nonclustered index
	u_dc
on
	connection_statuses(connection_status_id)
go

create unique nonclustered index 
        u_dcd
on
        connection_statuses(name)
go

if not exists(select relation from keys where relation = "connection_statuses")
begin
	insert into connection_statuses values(1, "Pending")
	insert into connection_statuses values(2, "Active")
	insert into connection_statuses values(3, "Suspended")
	insert into connection_statuses values(4, "Retired")

	insert into
		keys
	values(
		"connection_statuses",
		4
	)
end
go

if not exists(select name from tables where name = "connection_statuses")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"connection_statuses",
		"E"
	)
end
go
