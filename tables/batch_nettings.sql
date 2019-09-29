use
	risk_edgewater_test
go

drop table
	batch_nettings
go

create table
	batch_nettings(
		batch_id int,
		tico_account_id int,
		timestamp datetime,
		status_id int)
go

create unique index
	u_bn
on
	batch_nettings(
		batch_id)
go


	
