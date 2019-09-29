create table
	outside_account_info(
		outside_account_id int,
		account_number varchar(100),
		account_code varchar(100) NULL,
		account_code_type_id int NULL,
		checksum varchar(200) NULL,
		checksum_user_id int NULL,
		approval_user_id int NULL
		
)
go

create unique nonclustered index 
	pk
on
	outside_account_info(outside_account_id)
go


if not exists(select name from tables where name = "outside_account_info")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"outside_account_info",
		"L"
	)
end
go
