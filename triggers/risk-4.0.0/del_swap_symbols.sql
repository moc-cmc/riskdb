
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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbols: delete "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.timestamp), 9) + "'"
    )
from
    deleted a

go
