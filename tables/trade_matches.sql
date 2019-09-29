create table
	trade_matches(
		trade_match_id int identity,
		trade_id int,
		matching_engine_id int,
		match_status_id int)
go

alter table trade_matches lock datarows
go

create unique nonclustered index
	u_tm
on
	trade_matches(
		trade_id,
		matching_engine_id)
go

create unique nonclustered index
	u_ntm
on
	trade_matches(
		trade_match_id)

go
