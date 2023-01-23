
if object_id("ins_dist_list_channel_subs") != NULL
    drop trigger
        ins_dist_list_channel_subs
go

create trigger
    ins_dist_list_channel_subs
on
    dist_list_channel_subs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_list_channel_subs: insert "
        + convert(varchar(10), a.dist_list_channel_sub_id) + " "
        + convert(varchar(10), a.dist_list_id) + " "
        + convert(varchar(10), a.channel_id) + " "
        + (case when a.item_id = NULL then "NULL" else convert(varchar(10), a.item_id) end) + " "
        + convert(varchar(10), a.min_priority_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    inserted a

go
