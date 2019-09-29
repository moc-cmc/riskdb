use
	risk_rcm
go

drop table
	trading_levels
go

create table
	trading_levels(
 		external_account_id int,
		date datetime,
		trading_level  float)

go

create unique index
	u_tl
on
	trading_levels(
		external_account_id,
		date)

go

