
if object_id("upd_user_device_users") != NULL
    drop trigger
        upd_user_device_users
go

create trigger
    upd_user_device_users
on
    user_device_users
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_users: update "
        + convert(varchar(10), a.user_device_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    inserted a

go
