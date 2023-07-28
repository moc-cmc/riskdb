
if object_id("ins_external_account_symbols") != NULL
    drop trigger
        ins_external_account_symbols
go

create trigger
    ins_external_account_symbols
on
    external_account_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_symbols: insert "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
