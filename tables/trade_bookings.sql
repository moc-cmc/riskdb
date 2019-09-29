if object_id("trade_bookings") != NULL and (select count(*) from trade_bookings) = 0
    drop table
        trade_bookings
go

create table
    trade_bookings (
	trade_id int,
	booking_id int
)
lock datarows
go

create unique nonclustered index
	pk
on
        trade_bookings(trade_id, booking_id)
go

/* this is going to be inserted as the booking id */
if not exists(select relation from keys where relation = "trade_bookings")
begin
	insert into
		keys
	values(
		"trade_bookings",
		0
	)
end
go

if not exists(select name from tables where name = "trade_bookings")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"trade_bookings",
		"J"
	)
end
go
