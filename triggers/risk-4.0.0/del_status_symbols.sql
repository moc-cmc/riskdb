
if object_id("del_status_symbols") != NULL
    drop trigger
        del_status_symbols
go

create trigger
    del_status_symbols
on
    status_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".status_symbols: delete "
        + convert(varchar(10), a.status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.status_symbol, "'", "\'") + "'"
    )
from
    deleted a

go
