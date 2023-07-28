
if object_id("del_user_devices") != NULL
    drop trigger
        del_user_devices
go

create trigger
    del_user_devices
on
    user_devices
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_devices: delete "
        + convert(varchar(10), a.user_device_id) + " "
        + "'" + str_replace(a.identifier, "'", "\'") + "' "
        + (case when a.title = NULL then "NULL" else "'" + str_replace(a.title, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.user_device_type_id) + " "
        + convert(varchar(10), a.user_device_platform_id) + " "
        + convert(varchar(10), a.status_id)
    )
from
    deleted a

go
