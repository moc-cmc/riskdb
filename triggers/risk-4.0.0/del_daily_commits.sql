
if object_id("del_daily_commits") != NULL
    drop trigger
        del_daily_commits
go

create trigger
    del_daily_commits
on
    daily_commits
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".daily_commits: delete "
        + convert(varchar(10), a.daily_commit_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.commit_date), 9) + "' "
        + convert(varchar(10), a.commit_status_id)
    )
from
    deleted a

go
