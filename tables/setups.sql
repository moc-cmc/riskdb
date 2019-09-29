use
	risk_spo
go


drop table
	setups
go

create table
	setups(
		setup_id int,
		name varchar(250),
		setup_type_id int)
go

create unique index
	u_s
on
	setups(
		setup_id)
go

create unique index
	n_s
on
	setups(
		name)
go

delete

from
	keys
where
	relation = "setups"

insert into
	keys
values(
	"setups",
	0)
go

