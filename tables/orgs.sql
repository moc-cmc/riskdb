
create table
	orgs(
		org_id int identity,
		name varchar(50)
)
go

create unique nonclustered index 
	u_s
on
	orgs(org_id)
go

create unique nonclustered index 
        u_sn
on
        orgs(name)
go

if not exists(select name from tables where name = "orgs")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"orgs",
		"L"
	)
end
go
