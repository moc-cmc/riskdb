use
	risk_edgewater
go

drop table
	risk_classes
go

create table
	risk_classes(
		risk_class_id int,
		name varchar(100),
		reverse_perspective varchar(5) NULL,
		agency_style varchar(5) NULL)
go

create unique index
	u_rd
on
	risk_classes(
		risk_class_id)

create unique index
	n_rd
on
	risk_classes(
		name)
go

delete

from
	keys
where
	relation = "risk_classes"
go

insert into
	keys
values(
	"risk_classes",
	3)
go

