
if object_id("ins_product_symbols") != NULL
    drop trigger
        ins_product_symbols
go

create trigger
    ins_product_symbols
on
    product_symbols
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_symbols: insert "
        + (case when a.product_id = NULL then "NULL" else convert(varchar(10), a.product_id) end) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    inserted a

go
