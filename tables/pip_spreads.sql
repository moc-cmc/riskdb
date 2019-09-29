
drop table
	pip_spreads
go

create table
	pip_spreads(
		pip_spread_id int,
		name varchar(200))
go

create unique index
	u_ps
on
	pip_spreads(
		pip_spread_id)
go

create unique index
	n_ps
on
	pip_spreads(
		name)
go

delete

from
	keys
where
	relation = "pip_spreads"
go

insert into
	keys
values(
	"pip_spreads",
	0)
go


