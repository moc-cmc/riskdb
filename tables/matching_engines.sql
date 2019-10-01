create table
	matching_engines(
		matching_engine_id int,
		name varchar(50),
		outbound_source_id int,
		initial_match_status_id int)
go

create unique index
	u_me
on
	matching_engines(
		matching_engine_id)
go

create unique index
	n_me
on
	matching_engines(
		name)
go

delete

from
	keys
where
	relation = "matching_engines"

insert into
	keys
values(
	"matching_engines",
	0)
go
