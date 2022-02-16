
if object_id("del_user_channels") != NULL
    drop trigger
        del_user_channels
go

create trigger
    del_user_channels
on
    user_channels
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_channels: delete "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.channel_id)
    )
from
    deleted a

go
