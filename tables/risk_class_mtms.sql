use
	risk_edgewater
go

drop table
	beta_risk_class_mtms
go

create table
	beta_risk_class_mtms(
		id int,
		risk_class_id int,
		trade_date datetime,
		settled_pl float NULL,
		open_equity float NULL,
		volume float NULL,
		yield float NULL)
go

create unique index
	u_rcm
on
	beta_risk_class_mtms(
		id)
go

create unique index
	n_rcm
on
	beta_risk_class_mtms(
		risk_class_id,
		trade_date)
go

delete

from
	keys
where
	relation = "beta_risk_class_mtms"
go

insert into
	keys
values(
	"beta_risk_class_mtms",
	0)
go



