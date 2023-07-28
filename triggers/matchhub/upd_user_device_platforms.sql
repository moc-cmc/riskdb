
if object_id("upd_user_device_platforms") != NULL
    drop trigger
        upd_user_device_platforms
go

create trigger
    upd_user_device_platforms
on
    user_device_platforms
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_platforms: update "
        + convert(varchar(10), a.user_device_platform_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
