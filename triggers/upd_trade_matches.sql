if object_id("upd_trade_matches") != NULL
    drop trigger
        upd_trade_matches
go

create trigger
    upd_trade_matches
on
    trade_matches
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_matches: update "
        + convert(varchar(50), a.trade_match_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.matching_engine_id) + " "
        + convert(varchar(10), a.match_status_id)
    )
from
    inserted a

go
