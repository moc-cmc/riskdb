use
	risk_edgewater
go

drop table
	reverse_persective_accounts
go

create table
	reverse_persective_accounts(
		external_account_id int)
go

create unique index
	u_rpa
on
	reverse_persective_accounts(
		external_account_id)
go
