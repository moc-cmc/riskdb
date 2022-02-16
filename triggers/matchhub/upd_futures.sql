
if object_id("upd_futures") != NULL
    drop trigger
        upd_futures
go

create trigger
    upd_futures
on
    futures
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".futures: update "
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
    inserted a

go
