
if object_id("ins_message_types") != NULL
    drop trigger
        ins_message_types
go

create trigger
    ins_message_types
on
    message_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_types: insert "
        + convert(varchar(10), a.message_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
