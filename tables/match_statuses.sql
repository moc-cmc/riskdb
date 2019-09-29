drop table
	match_statuses
go

create table
	match_statuses(
		match_status_id int,
		name varchar(50))
go

create unique index
	u_ms
on
	match_statuses(
		match_status_id)
go

create unique index
	n_ms
on
	match_statuses(
		name)
go

insert into match_statuses values(1, "Pending")
go
insert into match_statuses values(2, "Submitted")
go
insert into match_statuses values(3, "Error")
go
insert into match_statuses values(4, "Unmatched")
go
insert into match_statuses values(5, "Mismatch")
go
insert into match_statuses values(6, "Matched")
go
insert into match_statuses values(7, "Cancel")
go
insert into match_statuses values(8, "Busted")
go
insert into match_statuses values(9, "Stale")
go

delete

from
	keys
where
	relation = "match_statuses"

insert into
	keys
values(
	"match_statuses",
	9)

go
