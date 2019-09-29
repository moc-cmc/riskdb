create table
	outside_account_code_types(
		outside_account_code_type_id int,
		name varchar(50)
)

create unique nonclustered index 
	pk
on
	outside_account_code_types(outside_account_code_type_id)
go

create unique nonclustered index
        nk
on
        outside_account_code_types(name)
go



if not exists(select name from tables where name = "outside_account_code_types")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"outside_account_code_types",
		"E"
	)
	
	insert into 
		keys 
	values(
		"outside_account_code_types", 
		4
	)
	insert into outside_account_code_types values(1, "ABA")
	insert into outside_account_code_types values(2, "IBAN")
	insert into outside_account_code_types values(3, "SWIFT")
end
go
