
if object_id("ins_trade_type_symbols") != NULL
    drop trigger
        ins_trade_type_symbols
go

create trigger
    ins_trade_type_symbols
on
    trade_type_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_type_symbols: insert "
        + convert(varchar(10), a.trade_type_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    inserted a

go
