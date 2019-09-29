
if object_id("ins_counterparty_symbols") != NULL
    drop trigger
        ins_counterparty_symbols
go

create trigger
    ins_counterparty_symbols
on
    counterparty_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparty_symbols: insert "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
