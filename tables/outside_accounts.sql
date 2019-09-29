create table
	outside_accounts(
		outside_account_id int,
		outside_account_type_id int,
		legal_entity_id int,
		provider_id int,
		name varchar(100)
)

create unique nonclustered index
	pk
on
	outside_accounts(outside_account_id)
go

create unique nonclustered index
	nk_e
on
	outside_accounts(legal_entity_id, provider_id, name)
go

if not exists(select name from tables where name = "outside_accounts")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"outside_accounts",
		"L"
	)
end
go

if not exists(select relation from keys where relation = "outside_accounts")
begin
        insert into
                keys
        values(
                "outside_accounts",
                0
        )
end
go



	


