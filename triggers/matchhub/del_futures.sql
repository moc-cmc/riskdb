
if object_id("del_futures") != NULL
    drop trigger
        del_futures
go

create trigger
    del_futures
on
    futures
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".futures: delete "
        + convert(varchar(10), a.future_id) + " "
        + convert(varchar(10), a.forward_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + "'" + str_replace(a.root_symbol, "'", "\'") + "' "
        + convert(varchar(10), a.exchange_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(50), a.tick_size) + " "
        + (case when a.future_type_id = NULL then "NULL" else convert(varchar(10), a.future_type_id) end)
    )
from
    deleted a

go
