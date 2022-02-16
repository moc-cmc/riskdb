
if object_id("del_user_device_types") != NULL
    drop trigger
        del_user_device_types
go

create trigger
    del_user_device_types
on
    user_device_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_types: delete "
        + convert(varchar(10), a.user_device_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
