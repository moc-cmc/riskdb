
if object_id("del_product_types") != NULL
    drop trigger
        del_product_types
go

create trigger
    del_product_types
on
    product_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_types: delete "
        + convert(varchar(10), a.product_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
