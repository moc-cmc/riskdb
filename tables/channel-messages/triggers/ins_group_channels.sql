
if object_id("ins_group_channels") != NULL
    drop trigger
        ins_group_channels
go

create trigger
    ins_group_channels
on
    group_channels
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".group_channels: insert "
        + convert(varchar(10), a.group_id) + " "
        + convert(varchar(10), a.channel_id)
    )
from
    inserted a

go
