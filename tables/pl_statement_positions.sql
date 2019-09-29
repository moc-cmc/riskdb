use
	risk_rcm
go

drop table
	pl_statement_positions
go

create table
	pl_statement_positions(
		pl_statement_id int,
		position_id int,
		external_account_id int,
		contract_id int,
		size float ,
		currency_id int,
		quantity int,
		open_price float NULL,
		close_price float NULL,
		native_pl float NULL,
		p_l float NULL,
		product_id int,
		delta float NULL)
go


create unique index
	u_psp
on
	pl_statement_positions(
		pl_statement_id,
		external_account_id,
		contract_id)
go
		
		
