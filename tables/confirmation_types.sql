drop table
	confirmation_types
go

create table
	confirmation_types(
		confirmation_type_id int,
		name varchar(50))
go

create unique index
	u_ct
on
	confirmation_types(
		confirmation_type_id)
go

create unique index
	n_ct
on
	confirmation_types(
		name)
go

insert into
	confirmation_types
values(
	1,
	"Unknown")
go

insert into
	confirmation_types
values(
	2,
	"Non Same Day")
go
insert into
	confirmation_types
values(
	3,
	"Same Day")
go
insert into
	confirmation_types
values(
	4,
	"Net Amount")
go
insert into
	confirmation_types
values(
	5,
	"Other Amount")
go

delete

from
	keys
where
	relation = "confirmation_types"
go

insert into
	keys
values(
	"confirmation_types",
	5)
go

