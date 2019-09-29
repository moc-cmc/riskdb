create table
	credit_update_types(
		credit_update_type_id int,
		name varchar(25)
)

create unique nonclustered index 
	pk
on
	credit_update_types(credit_update_type_id)
go

create unique nonclustered index
	nk	
on
	credit_update_types(name)
go


if not exists(select name from tables where name = "credit_update_types")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"credit_update_types",
		"E"
	)
	
	insert into 
		keys 
	values(
		"credit_update_types", 
		2
	)

	insert into credit_update_types values(1, "Pull")
	insert into credit_update_types values(2, "Restore")
end
go

