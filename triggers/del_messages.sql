
if object_id("del_messages") != NULL
    drop trigger
        del_messages
go

create trigger
    del_messages
on
    messages
for
    delete
as

declare @result int

select
    @result = syb_sendmsg(b.host, b.port,
        "@" + @@servername + "." + db_name() + " notify delete messages "
        + convert(varchar(10), message_id) + " "
        + convert(varchar(10), author_user_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), date), 9) + "' "
        + convert(varchar(10), channel_id) + " "
        + (case when item_relation_id = NULL then "NULL" else convert(varchar(10), item_relation_id) end) + " "
        + (case when item_id = NULL then "NULL" else convert(varchar(10), item_id) end) + " "
        + "'" + str_replace(subject, "'", "\'") + "' "
        + (case when content = NULL then "NULL" else "'" + str_replace(content, "'", "\'") + "'" end) + " "
        + (case when properties = NULL then "NULL" else "'" + str_replace(properties, "'", "\'") + "'" end) + " "
        + convert(varchar(10), priority_id) + " "
        + convert(varchar(10), status_id)
    )
from
    deleted a,
    dbagents b

go
