
if object_id("ins_trader_symbols") != NULL
    drop trigger
        ins_trader_symbols
go

create trigger
    ins_trader_symbols
on
    trader_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trader_symbols: insert "
        + convert(varchar(10), a.trader_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
