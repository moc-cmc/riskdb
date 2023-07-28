
if object_id("ins_products") != NULL
    drop trigger
        ins_products
go

create trigger
    ins_products
on
    products
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".products: insert "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(10), a.product_type_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + (case when a.decimal_precision = NULL then "NULL" else convert(varchar(10), a.decimal_precision) end) + " "
        + (case when a.origination_type_id = NULL then "NULL" else convert(varchar(10), a.origination_type_id) end)
    )
from
    inserted a

go
