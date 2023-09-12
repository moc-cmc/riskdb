drop table
	match_hub_target_accounts
go

create table
	match_hub_target_accounts(
		trade_id int,
		target_external_account_id int,
		timestamp datetime)
go

create unique index
	u_mhta
on
	match_hub_target_accounts(
		trade_id)
go
