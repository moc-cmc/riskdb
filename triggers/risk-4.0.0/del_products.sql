
if object_id("del_products") != NULL
    drop trigger
        del_products
go

create trigger
    del_products
on
    products
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".products: delete "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(10), a.product_type_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
