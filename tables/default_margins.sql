use
	risk_edgewater
go

drop table
	default_margins
go

create table
	default_margins(
		default_margin_id int,
		fund_id int,
		contract_id int,
		margin float,
		as_of_date datetime)
go

create unique index
	u_dm
on
	default_margins(
		default_margin_id)

go


delete

from
	keys
where
	relation = "default_margins"
go

insert into
	keys
values(
	"default_margins",
	0)
go
