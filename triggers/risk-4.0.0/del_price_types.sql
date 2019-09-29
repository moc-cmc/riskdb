
if object_id("del_price_types") != NULL
    drop trigger
        del_price_types
go

create trigger
    del_price_types
on
    price_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".price_types: delete "
        + convert(varchar(10), a.price_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
