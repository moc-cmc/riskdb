
if object_id("ins_trade_aliases") != NULL
    drop trigger
        ins_trade_aliases
go

create trigger
    ins_trade_aliases
on
    trade_aliases
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_aliases: insert "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.alias, "'", "\'") + "'"
    )
from
    inserted a

go
