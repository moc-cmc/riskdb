use
	risk_pinepoint
go

drop table
	ext_margin_thresholds
go

create table
	ext_margin_thresholds(
		external_account_id int,
		date datetime,
		margin_threshold float)

go


