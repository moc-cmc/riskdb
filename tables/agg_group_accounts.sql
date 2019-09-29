drop table agg_group_accounts
go

create table
	agg_group_accounts(
		agg_group_id int,
		external_account_id int
	)
go

create unique nonclustered index
	u_cg
on
	agg_group_accounts(agg_group_id, external_account_id)
go

