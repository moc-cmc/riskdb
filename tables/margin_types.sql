
drop table
	margin_types
go

create table
	margin_types(
		margin_type_id int,
		name varchar(100))
go

create unique index
	u_mt
on
	margin_types(
		margin_type_id)
go

create unique index
	n_mt
on
	margin_types(
		name)
go

delete

from
	keys
where
	relation = "margin_types"
go

insert into
	keys
values(
	"margin_types",
	0)
go

insert into
	tables
values(
	"margin_types",
	"L"
)
go


