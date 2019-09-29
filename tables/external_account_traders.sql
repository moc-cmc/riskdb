create table
    external_account_traders (
        external_account_id int,
        trader_id int
    )
go

create unique nonclustered index
	pk
on
	external_account_traders(external_account_id, trader_id)
go

create unique nonclustered index
        pkrv
on
        external_account_traders(trader_id, external_account_id)
go

if not exists(select name from tables where name = "external_account_traders")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "external_account_traders",
                "L"
        )
end
go

