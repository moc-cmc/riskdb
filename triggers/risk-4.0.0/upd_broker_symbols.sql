
if object_id("upd_broker_symbols") != NULL
    drop trigger
        upd_broker_symbols
go

create trigger
    upd_broker_symbols
on
    broker_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".broker_symbols: update "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
