
if object_id("upd_trade_aliases") != NULL
    drop trigger
        upd_trade_aliases
go

create trigger
    upd_trade_aliases
on
    trade_aliases
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_aliases: update "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    inserted a

go
