use
	risk_moc
go

drop table
	fixings
go

create table
	fixings(
		fixing_id int,
		contract_id int,
		fixing_date datetime,
		price float)
create unique index
	u_f
on
	fixings(
		fixing_id)
go

create unique index
	n_f
on
	fixings(
		contract_id,
		fixing_date)
go

delete

from
	keys
where
	relation = "fixings"
go

insert into
	keys
values(
	"fixings",
	0)
go

