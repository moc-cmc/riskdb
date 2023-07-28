
if object_id("ins_user_device_users") != NULL
    drop trigger
        ins_user_device_users
go

create trigger
    ins_user_device_users
on
    user_device_users
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_users: insert "
        + convert(varchar(10), a.user_device_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    inserted a

go
