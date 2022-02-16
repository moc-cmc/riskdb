
if object_id("del_broker_symbols") != NULL
    drop trigger
        del_broker_symbols
go

create trigger
    del_broker_symbols
on
    broker_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".broker_symbols: delete "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    deleted a

go
