
drop table
	collateral_agreements
go

create table
	collateral_agreements(
		collateral_agreement_id int,
		name varchar(200))
go

create unique index
	u_ca
on
	collateral_agreements(
		collateral_agreement_id)
go

create unique index
	n_ca
on
	collateral_agreements(
		name)
go

delete

from
	keys
where
	relation = "collateral_agreements"
go

insert into
	keys
values(
	"collateral_agreements",
	0)
go

insert into
	tables
values(
	"collateral_agreements",
	"L"
)
go
