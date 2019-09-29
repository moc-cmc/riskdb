drop table
	desks
go

create table
	desks(
		desk_id int,
		name varchar(50))
go

create unique index
	u_d
on
	desks(
		desk_id)
go

create unique index
	n_d
on
	desks(
		name)
go

delete

from
	keys
where
	relation = "desks"

insert into
	keys
values(
	"desks",
	0)
go
