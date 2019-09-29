
if object_id("del_exchanges") != NULL
    drop trigger
        del_exchanges
go

create trigger
    del_exchanges
on
    exchanges
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exchanges: delete "
        + convert(varchar(10), a.exchange_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
