
if object_id("del_trade_aliases") != NULL
    drop trigger
        del_trade_aliases
go

create trigger
    del_trade_aliases
on
    trade_aliases
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_aliases: delete "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    deleted a

go
