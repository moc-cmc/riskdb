
if object_id("upd_swap_symbols") != NULL
    drop trigger
        upd_swap_symbols
go

create trigger
    upd_swap_symbols
on
    swap_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbols: update "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    inserted a

go
