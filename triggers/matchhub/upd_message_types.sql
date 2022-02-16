
if object_id("upd_message_types") != NULL
    drop trigger
        upd_message_types
go

create trigger
    upd_message_types
on
    message_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_types: update "
        + convert(varchar(10), a.message_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
