create table
	bo_master_accounts(
		bo_master_account_id int,
		external_account_id int,
		legal_entity_id int
)

create unique nonclustered index
	pk
on
	bo_master_accounts(bo_master_account_id)
go

create unique nonclustered index
	nk_e
on
	bo_master_accounts(external_account_id)
go


if not exists(select name from tables where name = "bo_master_accounts")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"bo_master_accounts",
		"L"
	)
end
go

if not exists(select relation from keys where relation = "bo_master_accounts")
begin
        insert into
                keys
        values(
                "bo_master_accounts",
                0
        )
end
go



	


