
if object_id("upd_counterparty_symbols") != NULL
    drop trigger
        upd_counterparty_symbols
go

create trigger
    upd_counterparty_symbols
on
    counterparty_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparty_symbols: update "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
