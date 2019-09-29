
drop table
	trade_captures
go

create table
	trade_captures (
		trade_capture_id int,
		trade_id         int,
		connection_id    int,
		capture_date     datetime)
go

create unique index tci on
	trade_captures (trade_capture_id)
go

delete

from
        keys
where
        relation = "trade_captures"
go

insert into
        keys
values(
        "trade_captures",
        0)
go

 

