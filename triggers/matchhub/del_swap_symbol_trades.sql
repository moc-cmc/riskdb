
if object_id("del_swap_symbol_trades") != NULL
    drop trigger
        del_swap_symbol_trades
go

create trigger
    del_swap_symbol_trades
on
    swap_symbol_trades
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".swap_symbol_trades: delete "
        + convert(varchar(10), a.swap_symbol_id) + " "
        + convert(varchar(10), a.trade_id)
    )
from
    deleted a

go
