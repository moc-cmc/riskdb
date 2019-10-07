create table
    archive_trade_bookings (
	archive_batch_id int,
	trade_id int,
	booking_id int
)
lock datarows
go

create nonclustered index
	ar
on
	archive_trade_bookings(archive_batch_id)
go

create unique nonclustered index
	pk
on
        archive_trade_bookings(trade_id, booking_id)
go

if not exists(select name from tables where name = "archive_trade_bookings")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"archive_trade_bookings",
		"J"
	)
end
go
