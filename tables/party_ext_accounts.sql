drop table party_ext_accounts
go

create table
	party_ext_accounts(
		party_ext_account_id int identity,
		party_id int,
		external_account_id int,
		clearing_party_id int
	)
go

create unique nonclustered index 
	u_p
on
	party_ext_accounts(external_account_id)
go

