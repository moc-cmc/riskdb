
if object_id("del_deal_exec_symbols") != NULL
    drop trigger
        del_deal_exec_symbols
go

create trigger
    del_deal_exec_symbols
on
    deal_exec_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_exec_symbols: delete "
        + convert(varchar(10), a.deal_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "'"
    )
from
    deleted a

go
