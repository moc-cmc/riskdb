drop table
	contact_types
go

create table
	contact_types(
		contact_type_id int,
		name varchar(100))
go

create unique index
	u_c
on
	contact_types(
		 contact_type_id)
go

create unique index
	n_c
on
	contact_types(
		name)
go


delete

from
	keys
where
	relation = "contact_types"

insert into
	keys
values(
	"contact_types",
	0)
go
