use 
	risk_moc
go

drop table
	nondeliverable_ccys
go

create table
	nondeliverable_ccys(
		product_id int)
go

create unique index
	u_nc
on
	nondeliverable_ccys
		(product_id)
go

