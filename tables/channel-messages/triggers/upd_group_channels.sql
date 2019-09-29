
if object_id("upd_group_channels") != NULL
    drop trigger
        upd_group_channels
go

create trigger
    upd_group_channels
on
    group_channels
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_channels: update "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.channel_id)
    )
from
    inserted a

go
