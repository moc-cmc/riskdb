drop table
	holidays
go

create table
	holidays(
		holiday_id int,
		name varchar(100))
go

create unique index
	u_h
on
	holidays(
		holiday_id)

create unique index
	n_h
on
	holidays(
		name)
go

delete

from
	keys
where
	relation = "holidays"

insert into
	keys
values(
	"holidays",
	0)
go
