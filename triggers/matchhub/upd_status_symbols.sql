
if object_id("upd_status_symbols") != NULL
    drop trigger
        upd_status_symbols
go

create trigger
    upd_status_symbols
on
    status_symbols
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".status_symbols: update "
        + convert(varchar(10), a.status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.status_symbol, "'", "\'") + "'"
    )
from
    inserted a

go
