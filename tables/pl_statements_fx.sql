use
	risk_pinepoint
go

drop table
	pl_statements_fx
go

create table
	pl_statements_fx(
		pl_statement_id int,
		external_account_id int,
		product_id int,
		opening_balance float,
		open_base_value float NULL,
		close_base_value float NULL,
		p_l float NULL)
go

create unique index
	u_pci
on
	pl_statements_fx(
		pl_statement_id,
		external_account_id,
		product_id)

go
