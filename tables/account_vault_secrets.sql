
create table 
	account_vault_secrets (
		account_vault_secret_id int,
		key_vault_id int,
		external_account_id int,
		source_id int,
		status_id int,
		added_by int,
		added_on datetime,
		secret_path varchar(255) NULL,
		description varchar(255) NULL
	)
go

create unique nonclustered index
	pk
on
	account_vault_secrets(
		account_vault_secret_id
	)
go

create unique nonclustered index
	nksy
on
	account_vault_secrets(
		source_id,
		external_account_id,
		key_vault_id,
		status_id)
go



if not exists(select * from keys where relation = "account_vault_secrets")
	insert into keys values("account_vault_secrets", 1)

if not exists(select * from tables where name = "account_vault_secrets")
	insert into tables(name, table_type) values("account_vault_secrets", "L")

go
