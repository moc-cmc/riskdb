
create table
	timings(
	timing_id int,
	timing varchar(12))

create unique index
	ti
on
	timings(
		timing_id)
go

insert into
	timings
values(
	1,
	"Maturity")

insert into
	timings
values(
	2,
	"Hit")
go

delete

from
	keys
where
	relation = "timings"

insert into
	keys
values(
	"timings",
	2)

go

