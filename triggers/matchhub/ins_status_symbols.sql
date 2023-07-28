
if object_id("ins_status_symbols") != NULL
    drop trigger
        ins_status_symbols
go

create trigger
    ins_status_symbols
on
    status_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".status_symbols: insert "
        + convert(varchar(10), a.status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.status_symbol, "'", "\'") + "'"
    )
from
    inserted a

go
