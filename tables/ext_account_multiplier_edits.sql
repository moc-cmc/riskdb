drop table ext_account_multiplier_edits
go

create table
	ext_account_multiplier_edits(
		tico_account_id int,
		timestamp datetime,
		external_account_id int,
		multiplier float NULL
)
go

create nonclustered index 
	u_eame
on
	ext_account_multiplier_edits(external_account_id)
go

