
if object_id("del_external_account_symbols") != NULL
    drop trigger
        del_external_account_symbols
go

create trigger
    del_external_account_symbols
on
    external_account_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_symbols: delete "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    deleted a

go
