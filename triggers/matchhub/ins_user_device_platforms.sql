
if object_id("ins_user_device_platforms") != NULL
    drop trigger
        ins_user_device_platforms
go

create trigger
    ins_user_device_platforms
on
    user_device_platforms
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_device_platforms: insert "
        + convert(varchar(10), a.user_device_platform_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
