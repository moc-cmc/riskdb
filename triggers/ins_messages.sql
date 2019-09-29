
if object_id("ins_messages") != NULL
    drop trigger
        ins_messages
go

create trigger
    ins_messages
on
    messages
for
    insert
as

declare @result int

select
    @result = syb_sendmsg(b.host, b.port,
        "@" + @@servername + "." + db_name() + " notify insert messages "
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
    inserted a,
    dbagents b

go
