use
	risk_vscap
go

drop table
	pl_statement_fwd_positions
go

create table
	pl_statement_fwd_positions(
		pl_statement_id int,
		external_account_id int,
		product_id int,
                value_date datetime,
                position numeric(30,4),
                begin_usd numeric(30,4),
                end_usd numeric(30,4),
                p_l numeric(30,4))


go

create unique index
	u_psfp
on
	pl_statement_fwd_positions(
		pl_statement_id,
		external_account_id,
		product_id,
		value_date)
go
	

