
if object_id("del_message_types") != NULL
    drop trigger
        del_message_types
go

create trigger
    del_message_types
on
    message_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_types: delete "
        + convert(varchar(10), a.message_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
