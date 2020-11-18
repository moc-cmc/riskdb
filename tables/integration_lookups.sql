create table
	integration_lookups(
		integration_lookup_id int identity,
		source_id int,
		symbol varchar(50)
)
go


create unique nonclustered index
	pk
on
	integration_lookups(integration_lookup_id)
go

create unique nonclustered index
	u_n 
on
	integration_lookups(source_id, symbol)
go


if not exists(select name from tables where name = "integration_lookups")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"integration_lookups",
		"L"
	)
end
go



