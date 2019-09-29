use
	risk_sjmdemo
go

drop table
	ledger_request_logs
go

create table
	ledger_request_logs(
		ledger_request_log_id int,
		ledger_request_id int,
		user_id int,
		timestamp datetime,
		status_id int)
go

create unique index
	u_lrl
on
	ledger_request_logs(
		ledger_request_log_id)
go

delete

from
	keys
where
	relation = "ledger_request_logs"
go

insert into
	keys
values(
	"ledger_request_logs",
	0)
go
