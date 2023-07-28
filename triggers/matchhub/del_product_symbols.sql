
if object_id("del_product_symbols") != NULL
    drop trigger
        del_product_symbols
go

create trigger
    del_product_symbols
on
    product_symbols
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_symbols: delete "
        + (case when a.product_id = NULL then "NULL" else convert(varchar(10), a.product_id) end) + " "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "'"
    )
from
    deleted a

go
