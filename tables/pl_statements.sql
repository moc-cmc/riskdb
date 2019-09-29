use
	risk_rcm
go

drop table
	pl_statements
go

create table
	pl_statements(
		pl_statement_id int,
		trading_day_id int,
		internal_account_id int,
		status_id int)
go

create unique index
	u_ps
on
	pl_statements(
		pl_statement_id)
go

create unique index
	n_ps
on
	pl_statements(
		trading_day_id,
		internal_account_id)
go

delete

from
	keys
where
	relation = "pl_statements"

insert into
	keys
values(
	"pl_statements",
	0)
go

