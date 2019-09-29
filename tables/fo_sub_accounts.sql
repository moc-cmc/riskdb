create table
	fo_sub_accounts(
		fo_sub_account_id int,
		bo_master_account_id int,
		external_account_id int
)

create unique nonclustered index
	pk
on
	fo_sub_accounts(fo_sub_account_id)
go

create unique nonclustered index
	nk_e
on
	fo_sub_accounts(external_account_id)
go

create nonclustered index
	fo_boex
on
	fo_sub_accounts(bo_master_account_id, external_account_id)
go


if not exists(select name from tables where name = "fo_sub_accounts")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"fo_sub_accounts",
		"L"
	)
end
go

if not exists(select relation from keys where relation = "fo_sub_accounts")
begin
        insert into
                keys
        values(
                "fo_sub_accounts",
                0
        )
end
go



	


