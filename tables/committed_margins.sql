
drop table
	committed_margins
go


create table
	committed_margins(
		external_account_id int,
		trade_date datetime,
		nop_type_id int,
		margin_use float NULL)
go

create unique index
	u_cm
on
	committed_margins(
		external_account_id,
		trade_date)
go



