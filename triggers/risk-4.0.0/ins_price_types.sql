
if object_id("ins_price_types") != NULL
    drop trigger
        ins_price_types
go

create trigger
    ins_price_types
on
    price_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".price_types: insert "
        + convert(varchar(10), a.price_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
