
if object_id("upd_swap_symbol_trades") != NULL
    drop trigger
        upd_swap_symbol_trades
go

create trigger
    upd_swap_symbol_trades
on
    swap_symbol_trades
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbol_trades: update "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + convert(varchar(10), a.trade_id)
    )
from
    inserted a

go
