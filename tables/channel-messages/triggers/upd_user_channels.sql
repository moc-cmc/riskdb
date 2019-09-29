
if object_id("upd_user_channels") != NULL
    drop trigger
        upd_user_channels
go

create trigger
    upd_user_channels
on
    user_channels
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_channels: update "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.channel_id)
    )
from
    inserted a

go
