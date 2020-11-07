drop table
	default_account_spreads
go

create table
	default_account_spreads(
		account_spread_id int,
		contract_id int,
		pips float null,
		name varchar(30) null
)

create unique nonclustered index
	das_pk
on
	default_account_spreads(account_spread_id)
go

create unique nonclustered index
	das_ct
on
	default_account_spreads(contract_id)
go

	

if not exists(select name from tables where name = "default_account_spreads")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "default_account_spreads",
        "L"
    )
end
go

insert into
	keys
values(
	"default_account_spreads",
	0
)
go
