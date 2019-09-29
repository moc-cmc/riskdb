create table
	trade_matches_log(
		trade_match_id int,
		trade_id int,
		matching_engine_id int,
		match_status_id int,
		edited_by int,
		timestamp datetime)
go

create unique index
	u_tm
on
	trade_matches_log(
		trade_match_id)

go
