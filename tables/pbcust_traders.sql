create table
	pbcust_traders(
		client_trader_id int,
		cover_trader_id int
)

create unique nonclustered index
	pk
on 
	pbcust_traders(client_trader_id)
go

if not exists(select name from tables where name = "pbcust_traders")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"pbcust_traders",
		"L"
	)
	
end
go

