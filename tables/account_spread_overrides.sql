drop table
	account_spread_overrides
go

create table
	account_spread_overrides(
		account_spread_id int,
		external_account_id int,
		contract_id int,
		pips float null,
		name varchar(30) null
)

create unique nonclustered index
	pk
on
	account_spread_overrides(account_spread_id)
go

create unique nonclustered index
	u_eact
on
	account_spread_overrides(external_account_id, contract_id)
go

	

if not exists(select name from tables where name = "account_spread_overrides")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "account_spread_overrides",
        "L"
    )
end
go

insert into
	keys
values(
	"account_spread_overrides",
	0
)
go
