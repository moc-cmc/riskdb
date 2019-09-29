
create table
	providers(
		provider_id int,
		name varchar(100)
)
go

create unique nonclustered index 
	u_s
on
	providers(provider_id)
go

create unique nonclustered index 
        u_sn
on
        providers(name)
go


if not exists(select last_id from keys where relation = "providers")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"providers",
		0
	)
end
go

if not exists(select name from tables where name = "providers")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "providers",
                "L"
        )
end
go

