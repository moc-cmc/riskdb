
if object_id("ins_commit_logs") != NULL
    drop trigger
        ins_commit_logs
go

create trigger
    ins_commit_logs
on
    commit_logs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".commit_logs: insert "
        + convert(varchar(10), commit_log_id) + " "
        + convert(varchar(10), committed_by) + " "
        + convert(varchar(10), status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), commit_date), 9) + "' "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), timestamp), 9) + "'"
    )
from
    inserted

go