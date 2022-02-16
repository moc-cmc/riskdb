
if object_id("ins_channels") != NULL
    drop trigger
        ins_channels
go

create trigger
    ins_channels
on
    channels
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".channels: insert "
        + convert(varchar(10), a.channel_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.item_relation_id = NULL then "NULL" else convert(varchar(10), a.item_relation_id) end) + " "
        + (case when a.item_id = NULL then "NULL" else convert(varchar(10), a.item_id) end) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    inserted a

go
