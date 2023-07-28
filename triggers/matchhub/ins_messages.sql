
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
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".messages: insert "
        + convert(varchar(10), a.message_id) + " "
        + convert(varchar(10), a.author_user_id) + " "
        + "'" + convert(varchar(19), a.message_date, 23) + "." + substring(convert(varchar(15), a.message_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.channel_id) + " "
        + convert(varchar(10), a.message_type_id) + " "
        + "'" + str_replace(a.subject, "'", "\'") + "' "
        + (case when a.content = NULL then "NULL" else "'" + str_replace(a.content, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.priority_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    inserted a

go
