
if object_id("upd_user_phone_devices") != NULL
    drop trigger
        upd_user_phone_devices
go

create trigger
    upd_user_phone_devices
on
    user_phone_devices
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_devices: update "
        + convert(varchar(10), a.user_phone_id) + " "
        + convert(varchar(10), a.user_device_id)
    )
from
    inserted a

go
