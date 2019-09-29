
if object_id("upd_trader_symbols") != NULL
    drop trigger
        upd_trader_symbols
go

create trigger
    upd_trader_symbols
on
    trader_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trader_symbols: update "
        + convert(varchar(10), a.trader_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
