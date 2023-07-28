
if object_id("del_swap_symbols") != NULL
    drop trigger
        del_swap_symbols
go

create trigger
    del_swap_symbols
on
    swap_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbols: delete "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    deleted a

go
