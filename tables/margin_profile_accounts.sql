
drop table
	margin_profile_accounts
go

create table
	margin_profile_accounts(
		margin_profile_id int,
		external_account_id int)
go

create unique index
	u_mpa
on
	margin_profile_accounts(
		margin_profile_id,
		external_account_id)
go


