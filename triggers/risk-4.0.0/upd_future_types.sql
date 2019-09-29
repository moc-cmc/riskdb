
if object_id("upd_future_types") != NULL
    drop trigger
        upd_future_types
go

create trigger
    upd_future_types
on
    future_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".future_types: update "
        + convert(varchar(10), a.future_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
