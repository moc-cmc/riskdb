
if object_id("upd_brokers") != NULL
    drop trigger
        upd_brokers
go

create trigger
    upd_brokers
on
    brokers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".brokers: update "
        + convert(varchar(10), a.broker_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + convert(varchar(10), a.source_id)
    )
from
    inserted a

go
