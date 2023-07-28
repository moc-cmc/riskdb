
if object_id("del_user_phone_devices") != NULL
    drop trigger
        del_user_phone_devices
go

create trigger
    del_user_phone_devices
on
    user_phone_devices
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_devices: delete "
        + convert(varchar(10), a.user_phone_id) + " "
        + convert(varchar(10), a.user_device_id)
    )
from
    deleted a

go
