drop table credit_profile_accounts
go

create table
	credit_profile_accounts(
		credit_profile_id int,
		external_account_id int
	)
go

create unique nonclustered index
	u_cg
on
	credit_profile_accounts(credit_profile_id, external_account_id)
go

		
