drop table rematch_log
go

create table
	rematch_log(
		rematch_log_id int,
		timestamp datetime,
		pre_count int,
		post_count int,
		status_id int
)

create unique nonclustered index
	u_rl
on
	rematch_log(rematch_log_id)
go

create nonclustered index
	u_tm
on
	rematch_log(timestamp)
go

create nonclustered index
	n_s
on
	rematch_log(status_id)
go


insert into
	keys
values(
	"rematch_log",
	0
)
go

insert into tables values("rematch_log", "J")
go


