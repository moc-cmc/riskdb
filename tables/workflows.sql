use
	risk_makr_dev
go

drop table
	workflows
go

create table
	workflows(
		workflow_id int,
		name varchar(100))
go

create unique index
	u_w
on
	workflows(
		workflow_id)
go

create unique index
	n_w
on
	workflows(
		name)
go

delete

from
	keys
where
	relation = "workflows"

insert into
	keys
values(
	"workflows",
	0)
go
