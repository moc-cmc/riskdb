
if object_id("del_counterparty_symbols") != NULL
    drop trigger
        del_counterparty_symbols
go

create trigger
    del_counterparty_symbols
on
    counterparty_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparty_symbols: delete "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    deleted a

go
