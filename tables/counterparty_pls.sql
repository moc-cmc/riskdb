drop table
	counterparty_pls
go

create table
	counterparty_pls(
		counterparty_pl_id int identity,
		counterparty_id int,
		pl_date datetime,
		pl_attribution_model_id int,
		product_id int,
		pl float NULL,
		trade_count int
)
go

create unique nonclustered index
	u_pl 
on
	counterparty_pls(counterparty_pl_id)
go

create unique nonclustered index 
	u_pla
on
	counterparty_pls(counterparty_id, pl_date, pl_attribution_model_id, product_id)
go

create nonclustered index
	n_pla
on
	counterparty_pls(pl_date)
go


		
