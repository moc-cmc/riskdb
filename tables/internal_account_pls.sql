drop table
	internal_account_pls
go

create table
	internal_account_pls(
		internal_account_pl_id int identity,
		internal_account_id int,
		pl_date datetime,
		pl_attribution_model_id int,
		product_id int,
		pl float,
		trade_count int
)
go

create unique nonclustered index
	u_pl 
on
	internal_account_pls(internal_account_pl_id)
go

create unique nonclustered index 
	u_pla
on
	internal_account_pls(internal_account_id, pl_date, pl_attribution_model_id, product_id)
go

create nonclustered index
	n_pla
on
	internal_account_pls(pl_date)
go


		
