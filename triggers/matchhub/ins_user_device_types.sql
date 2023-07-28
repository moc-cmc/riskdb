
if object_id("ins_user_device_types") != NULL
    drop trigger
        ins_user_device_types
go

create trigger
    ins_user_device_types
on
    user_device_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_types: insert "
        + convert(varchar(10), a.user_device_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
