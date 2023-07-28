
if object_id("upd_exchanges") != NULL
    drop trigger
        upd_exchanges
go

create trigger
    upd_exchanges
on
    exchanges
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exchanges: update "
        + convert(varchar(10), a.exchange_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
