
if object_id("del_channels") != NULL
    drop trigger
        del_channels
go

create trigger
    del_channels
on
    channels
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".channels: delete "
        + convert(varchar(10), a.channel_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.item_relation_id = NULL then "NULL" else convert(varchar(10), a.item_relation_id) end) + " "
        + (case when a.item_id = NULL then "NULL" else convert(varchar(10), a.item_id) end) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    deleted a

go
