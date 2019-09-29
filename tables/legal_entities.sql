
create table
	legal_entities(
		legal_entity_id int,
		name varchar(255),
		lei varchar(100) NULL,
		status_id int NULL
)
go

create unique nonclustered index 
	u_s
on
	legal_entities(legal_entity_id)
go

create unique nonclustered index 
        u_sn
on
        legal_entities(name)
go



if not exists(select last_id from keys where relation = "legal_entities")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"legal_entities",
		1000
	)
end
go

if not exists(select name from tables where name = "legal_entities")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "legal_entities",
                "L"
        )
end
go

