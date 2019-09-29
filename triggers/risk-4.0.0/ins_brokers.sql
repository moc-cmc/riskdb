
if object_id("ins_brokers") != NULL
    drop trigger
        ins_brokers
go

create trigger
    ins_brokers
on
    brokers
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".brokers: insert "
        + convert(varchar(10), a.broker_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + convert(varchar(10), a.source_id)
    )
from
    inserted a

go
