drop table account_volumes
go

create table
	account_volumes
(
	external_account_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	account_volumes(external_account_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	account_volumes(volume_date)
go


