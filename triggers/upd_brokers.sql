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
        + convert(varchar(10), broker_id) + " "
        + "'" + rtrim(str_replace(symbol, "'", "\'")) + "' "
        + convert(varchar(10), source_id)
    )
from
    inserted

go