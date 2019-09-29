
create table
	connections (
		connection_id int,
		name 	varchar(50),
		ops_name varchar(50) NULL,
		source_id     int,
		integration_id int,
		connection_status_id int,
		stale_threshold int NULL,
		monitoring_enabled char(1) NULL
)
go

create unique nonclustered index pk on 
	connections (connection_id)
go

create unique nonclustered index 
	nk 
on
	connections(source_id, integration_id)
go

create unique nonclustered index
	nk_n
on
	connections(name)
go

if not exists(select relation from keys where relation = "connections")
begin
	insert into
		keys
	values(
		"connections",
		0
	)
end
go

if not exists(select name from tables where name = "connections")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"connections",
		"L"
	)
end
go


