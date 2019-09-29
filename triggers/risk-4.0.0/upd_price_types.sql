
if object_id("upd_price_types") != NULL
    drop trigger
        upd_price_types
go

create trigger
    upd_price_types
on
    price_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".price_types: update "
        + convert(varchar(10), a.price_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
