
create table 
	account_vault_secret_edits (
		account_vault_secret_id int,
		key_vault_id int,
		external_account_id int,
		source_id int,
		status_id int,
		added_by int,
		added_on datetime,
		secret_path varchar(255) NULL,
		description varchar(255) NULL,
		edited_at datetime,
		edited_by int,
		note varchar(255) NULL
	)
go

create unique nonclustered index
	pk
on
	account_vault_secret_edits(
		account_vault_secret_id,
		edited_at
	)
go

create nonclustered index
	nksy
on
	account_vault_secret_edits(
		source_id,
		external_account_id,
		key_vault_id)
go



if not exists(select * from tables where name = "account_vault_secret_edits")
	insert into tables(name, table_type) values("account_vault_secret_edits", "J")

go
