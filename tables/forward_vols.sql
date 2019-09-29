use
	risk_rcm
go

drop table
	forward_vols
go

create table
	forward_vols(
		forward_vol_id int,
		forward_id int,
		trade_date datetime,
		days int,
		data_points int,
		standard_deviation float,
		volatility float)
go

create unique index
	u_fv
on
	forward_vols(
		forward_vol_id)
go

create unique index
	n_fv
on
	forward_vols(
		forward_id,
		trade_date,
		days)

go

delete

from
	keys
where
	relation = "forward_vols"

insert into
	keys
values(
	"forward_vols",
	0)
go

