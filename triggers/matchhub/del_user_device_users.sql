
if object_id("del_user_device_users") != NULL
    drop trigger
        del_user_device_users
go

create trigger
    del_user_device_users
on
    user_device_users
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_users: delete "
        + convert(varchar(10), a.user_device_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    deleted a

go
