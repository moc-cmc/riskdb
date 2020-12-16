if object_id("acct_transaction_identifiers") != NULL
begin
	if (select count(*) from acct_transaction_identifiers) = 0
    		drop table
        		acct_transaction_identifiers
end
go

create table
    acct_transaction_identifiers (
	account_transaction_id int,
	source_id int,
	identifier varchar(50)
)
lock datarows
go

create unique nonclustered index
	pk
on
        acct_transaction_identifiers(account_transaction_id, source_id)
go

create unique nonclustered index
        nk
on
        acct_transaction_identifiers(source_id, identifier)
go

if not exists(select name from tables where name = "acct_transaction_identifiers")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"acct_transaction_identifiers",
		"J"
	)
end
go
