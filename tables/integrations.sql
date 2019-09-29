
create table
	integrations (
		integration_id int,
		name       varchar(50),
		org_id int NULL)
go

create unique index pk on
	integrations (integration_id)
go

create unique nonclustered index
	nk
on
	integrations(name)
go

if not exists(select relation from keys where relation = "integrations")
begin
	insert into
		keys
	values(
		"integrations",
		0
	)
end
go

if not exists(select name from tables where name = "integrations")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"integrations",
		"L"
	)
end
go


