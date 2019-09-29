print "creating recent_identifiers"
go

create table
    recent_identifiers (
	trade_id int,
	broker_id int,
	identifier varchar(100)
)
lock datarows
go

create unique nonclustered index
	pk
on
        recent_identifiers(trade_id)
go

create unique nonclustered index
        nk
on
        recent_identifiers(broker_id, identifier, trade_id)
go

if not exists(select name from tables where name = "recent_identifiers")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"recent_identifiers",
		"J"
	)
end
go
