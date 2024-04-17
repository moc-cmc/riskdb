
create table 
	key_vaults (
		key_vault_id int,
		name varchar(50),
		url varchar(100) NULL
	)
go

create unique nonclustered index
	pk
on
	key_vaults(
		key_vault_id
	)
go

create unique nonclustered index
	nksy
on
	key_vaults(
		name)
go


	

if not exists(select * from keys where relation = "key_vaults")
	insert into keys values("key_vaults", 1)

if not exists(select * from tables where name = "key_vaults")
	insert into tables(name, table_type) values("key_vaults", "L")

go
