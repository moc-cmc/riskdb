
if object_id("upd_address_types") != NULL
    drop trigger
        upd_address_types
go

create trigger
    upd_address_types
on
    address_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".address_types: update "
        + convert(varchar(10), a.address_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
