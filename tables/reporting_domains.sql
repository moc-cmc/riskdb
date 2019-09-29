use
	risk_finotec
go

drop table
	reporting_domains
go

create table
	reporting_domains(
		reporting_domain_id int,
		name varchar(100))
go

create unique index
	u_rd
on
	reporting_domains(
		reporting_domain_id)

create unique index
	n_rd
on
	reporting_domains(
		name)
go

insert into
	reporting_domains
values(
	1,
	"Uncategorized")

insert into
	reporting_domains
values(
	2,
	"Institutional")

insert into
	reporting_domains
values(
	3,
	"Retail")

delete

from
	keys
where
	relation = "reporting_domains"
go

insert into
	keys
values(
	"reporting_domains",
	3)
go

