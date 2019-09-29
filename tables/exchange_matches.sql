
create table
	exchange_matches(
		exchange_match_id int,
                symbol varchar(50),
                long_trade_id int,
                short_trade_id int,
                match_timestamp datetime,
                processing_timestamp datetime
)
go

create unique nonclustered index 
	u_emi
on
	exchange_matches(exchange_match_id)
go

create unique nonclustered index 
        u_lti
on
        exchange_matches(long_trade_id)
go

create unique nonclustered index
        u_sti
on
        exchange_matches(short_trade_id)
go


if not exists(select last_id from keys where relation = "exchange_matches")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"exchange_matches",
		0
	)
end
go

if not exists(select name from tables where name = "exchange_matches")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "exchange_matches",
                "J"
        )
end
go

