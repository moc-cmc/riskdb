create table
	ledger_request_types(
		ledger_request_type_id int,
		name varchar(100),
		create_pending_status_id int,
		sweep_pending_status_id int,
		cancel_pending_status_id int)
go


create unique index
	u_lrt
on
	ledger_request_types(
		ledger_request_type_id)
go

create unique index
	n_lrt
on
	ledger_request_types(
		name)
go

delete

from
	keys
where
	relation = "ledger_request_types"
go

insert into
	keys
values(
	"ledger_request_types",
	0)
go


