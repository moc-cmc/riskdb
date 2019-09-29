drop table trader_volumes
go

create table
	trader_volumes
(
	trader_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	trader_volumes(trader_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	trader_volumes(volume_date)
go


