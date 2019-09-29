
drop table
	margin_profile_counterparties
go

create table
	margin_profile_counterparties(
		margin_profile_id int,
		counterparty_id int)
go

create unique index
	u_mpc
on
	margin_profile_counterparties(
		margin_profile_id,
		counterparty_id)
go

