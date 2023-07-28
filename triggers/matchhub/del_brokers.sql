
if object_id("del_brokers") != NULL
    drop trigger
        del_brokers
go

create trigger
    del_brokers
on
    brokers
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".brokers: delete "
        + convert(varchar(10), a.broker_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + convert(varchar(10), a.source_id)
    )
from
    deleted a

go
