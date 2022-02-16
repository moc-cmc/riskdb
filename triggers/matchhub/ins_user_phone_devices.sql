
if object_id("ins_user_phone_devices") != NULL
    drop trigger
        ins_user_phone_devices
go

create trigger
    ins_user_phone_devices
on
    user_phone_devices
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_devices: insert "
        + convert(varchar(10), a.user_phone_id) + " "
        + convert(varchar(10), a.user_device_id)
    )
from
    inserted a

go
