use
	risk_spo
go

drop table
	setup_types
go

create table
	setup_types(
		setup_type_id int,
		name varchar(100))
go

create unique index
	u_st
on
	setup_types(
		setup_type_id)
go

create unique index
	n_st
on
	setup_types(
		name)
go

delete

from
	keys
where
	relation = "setup_types"

insert into
	keys
values(
	"setup_types",
	0)
go
