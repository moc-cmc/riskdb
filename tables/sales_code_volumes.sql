drop table sales_code_volumes
go

create table
	sales_code_volumes
(
	sales_code_id int,
	product_id int,
	volume_date datetime,
	volume numeric(30, 4),
	trade_count int
)
go

create unique nonclustered index
	u_av
on
	sales_code_volumes(sales_code_id, product_id, volume_date)
go

create nonclustered index
	n_av
on
	sales_code_volumes(volume_date)
go


