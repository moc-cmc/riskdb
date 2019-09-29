
if object_id("ins_product_types") != NULL
    drop trigger
        ins_product_types
go

create trigger
    ins_product_types
on
    product_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".product_types: insert "
        + convert(varchar(10), a.product_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
