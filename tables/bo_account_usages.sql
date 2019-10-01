create table
	bo_account_usages(
		external_account_id int,
		trade_date datetime,
		cash_equiv float NULL,
		open_equity float NULL,
		nop_type_id int NULL,
		margin_use float NULL)
go

create unique index
	u_bau
on
	bo_account_usages(
		external_account_id,
		trade_date)
go


