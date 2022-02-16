
if object_id("ins_broker_symbols") != NULL
    drop trigger
        ins_broker_symbols
go

create trigger
    ins_broker_symbols
on
    broker_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".broker_symbols: insert "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
