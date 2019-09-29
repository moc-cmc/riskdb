
if object_id("ins_daily_commits") != NULL
    drop trigger
        ins_daily_commits
go

create trigger
    ins_daily_commits
on
    daily_commits
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".daily_commits: insert "
        + convert(varchar(10), a.daily_commit_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.commit_date), 9) + "' "
        + convert(varchar(10), a.commit_status_id)
    )
from
    inserted a

go
