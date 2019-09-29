
if object_id("del_future_types") != NULL
    drop trigger
        del_future_types
go

create trigger
    del_future_types
on
    future_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".future_types: delete "
        + convert(varchar(10), a.future_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
