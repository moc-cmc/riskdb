drop table counterparty_volumes
go

create table
	counterparty_volumes
(
	counterparty_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	counterparty_volumes(counterparty_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	counterparty_volumes(volume_date)
go


