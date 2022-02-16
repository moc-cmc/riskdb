
if object_id("ins_exchanges") != NULL
    drop trigger
        ins_exchanges
go

create trigger
    ins_exchanges
on
    exchanges
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exchanges: insert "
        + convert(varchar(10), a.exchange_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
