drop table broker_volumes
go

create table
	broker_volumes
(
	broker_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	broker_volumes(broker_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	broker_volumes(volume_date)
go


