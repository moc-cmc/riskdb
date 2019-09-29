
drop table
	wire_net_accounts
go

create table
	wire_net_accounts(
		wire_net_account_id int,
		external_account_id int)
go

create unique index
	u_wna
on
	wire_net_accounts(
		wire_net_account_id,
		external_account_id)
go
