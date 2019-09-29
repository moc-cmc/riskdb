
if object_id("ins_swap_symbols") != NULL
    drop trigger
        ins_swap_symbols
go

create trigger
    ins_swap_symbols
on
    swap_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbols: insert "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.timestamp), 9) + "'"
    )
from
    inserted a

go
