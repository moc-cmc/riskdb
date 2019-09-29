drop table trade_volumes
go

create table
	trade_volumes(
		trade_id int,
		volume_date datetime,
		product_id int,
		volume numeric(30, 4)
)
go

create unique nonclustered index
	u_tp
on
	trade_volumes(trade_id, product_id, volume_date)
go

create nonclustered index
	n_tv
on 
	trade_volumes(volume_date)
go


