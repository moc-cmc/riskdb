
if object_id("del_trade_matches") != NULL
    drop trigger
        del_trade_matches
go

create trigger
    del_trade_matches
on
    trade_matches
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_matches: delete "
        + convert(varchar(10), a.trade_match_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.matching_engine_id) + " "
        + convert(varchar(10), a.match_status_id)
    )
from
    deleted a

go
