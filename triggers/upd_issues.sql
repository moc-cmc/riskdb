
if object_id("upd_issues") != NULL
    drop trigger
        upd_issues
go

create trigger
    upd_issues
on
    issues
for
    update
as

declare @result int

select
    @result = syb_sendmsg(b.host, b.port,
        "@" + @@servername + "." + db_name() + " notify update issues "
        + convert(varchar(10), issue_id) + " "
        + convert(varchar(10), author_user_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), date), 9) + "' "
        + convert(varchar(10), channel_id) + " "
        + (case when item_relation_id = NULL then "NULL" else convert(varchar(10), item_relation_id) end) + " "
        + (case when item_id = NULL then "NULL" else convert(varchar(10), item_id) end) + " "
        + "'" + str_replace(subject, "'", "\'") + "' "
        + (case when content = NULL then "NULL" else "'" + str_replace(content, "'", "\'") + "'" end) + " "
        + (case when properties = NULL then "NULL" else "'" + str_replace(properties, "'", "\'") + "'" end) + " "
        + convert(varchar(10), priority_id) + " "
        + convert(varchar(10), status_id) + " "
        + (case when check_sql = NULL then "NULL" else "'" + str_replace(check_sql, "'", "\'") + "'" end)
    )
from
    inserted a,
    dbagents b

go
