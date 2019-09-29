create table
	outside_wallets(
		outside_wallet_id int,
		external_account_id int,
		provider_id int,
		name varchar(100),
		address varchar(50)
)

create unique nonclustered index
	pk
on
	outside_wallets(outside_wallet_id)
go

create unique nonclustered index
	nk
on
	outside_wallets(address)
go

create unique nonclustered index
	nk_e
on
	outside_wallets(external_account_id, provider_id, name)
go

if not exists(select name from tables where name = "outside_wallets")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"outside_wallets",
		"L"
	)
end
go

if not exists(select relation from keys where relation = "outside_wallets")
begin
        insert into
                keys(
        values(
                "outside_wallets",
                0
        )
end
go



	


