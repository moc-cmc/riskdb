
if object_id("upd_products") != NULL
    drop trigger
        upd_products
go

create trigger
    upd_products
on
    products
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".products: update "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(10), a.product_type_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
