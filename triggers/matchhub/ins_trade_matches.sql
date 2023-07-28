
if object_id("ins_trade_matches") != NULL
    drop trigger
        ins_trade_matches
go

create trigger
    ins_trade_matches
on
    trade_matches
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_matches: insert "
        + convert(varchar(10), a.trade_match_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.matching_engine_id) + " "
        + convert(varchar(10), a.match_status_id)
    )
from
    inserted a

go
