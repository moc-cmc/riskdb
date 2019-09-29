drop table trade_type_volumes
go

create table
	trade_type_volumes
(
	trade_type_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	trade_type_volumes(trade_type_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	trade_type_volumes(volume_date)
go


