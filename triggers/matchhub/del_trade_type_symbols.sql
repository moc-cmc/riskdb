
if object_id("del_trade_type_symbols") != NULL
    drop trigger
        del_trade_type_symbols
go

create trigger
    del_trade_type_symbols
on
    trade_type_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_type_symbols: delete "
        + convert(varchar(10), a.trade_type_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    deleted a

go
