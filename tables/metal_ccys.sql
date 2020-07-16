create table
	metal_ccys(
		product_id int)
go

create unique index
	u_nc
on
	metal_ccys
		(product_id)
go

insert into tables values("metal_ccys", "L")
go


