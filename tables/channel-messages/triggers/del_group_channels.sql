
if object_id("del_group_channels") != NULL
    drop trigger
        del_group_channels
go

create trigger
    del_group_channels
on
    group_channels
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_channels: delete "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.channel_id)
    )
from
    deleted a

go
