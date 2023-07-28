
if object_id("ins_futures") != NULL
    drop trigger
        ins_futures
go

create trigger
    ins_futures
on
    futures
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".futures: insert "
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
