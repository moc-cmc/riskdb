use
	risk_abn
go

drop table
	sub_external_accounts
go

create table
	sub_external_accounts(
		master_account_id int,
		sub_account_id int)
go

create unique index
	u_n
on
	sub_external_accounts(
		sub_account_id)

go
