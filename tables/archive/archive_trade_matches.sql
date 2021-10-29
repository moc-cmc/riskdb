create table
    archive_trade_matches (
	archive_batch_id int,
	trade_match_id int,
	trade_id int,
	matching_engine_id int,
	match_status_id int
)
go

create nonclustered index
	ar
on
	archive_trade_matches(archive_batch_id)
go

create unique nonclustered index
	pk
on
        archive_trade_matches(trade_match_id)
go

if not exists(select name from tables where name = "archive_trade_matches")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"archive_trade_matches",
		"J"
	)
end
go
