use
	risk_cc
go

drop table
	pipping_schedules
go

create table
	pipping_schedules(
		id int,
		name varchar(200),
		timestamp datetime)
go

create unique index
	u_ps
on
	pipping_schedules(
		id)

go

create unique index
	n_ps
on
	pipping_schedules(
		name)
go

delete

from
	keys
where
	relation = "pipping_schedules"

go

insert into
	keys
values(
	"pipping_schedules",
	0)

go
