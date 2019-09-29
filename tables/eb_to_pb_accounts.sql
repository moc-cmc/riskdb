create table
	eb_to_pb_accounts(
		external_account_id int
	)
go

create unique nonclustered index
	u_e
on
	eb_to_pb_accounts(external_account_id)
go

if not exists(select table_int from tables where name = "eb_to_pb_accounts")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"eb_to_pb_accounts",
		"L"
	)
end
go
