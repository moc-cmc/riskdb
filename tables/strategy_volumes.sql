drop table strategy_volumes
go

create table
	strategy_volumes
(
	strategy_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	strategy_volumes(strategy_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	strategy_volumes(volume_date)
go


