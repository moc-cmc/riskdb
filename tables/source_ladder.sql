use
	risk_elviro
go

drop table
	source_ladder
go

create table
	source_ladder(
		source_id int,
		external_account_id int,
		product_id int,
		value_date datetime,
		source_balance numeric(30,4))
go


/* create unique index
	u_sl
on
	source_ladder(
		source_id,
		external_account_id,
		product_id,
		value_date) */
go


		
