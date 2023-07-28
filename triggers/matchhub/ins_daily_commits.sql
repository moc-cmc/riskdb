
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
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".daily_commits: insert "
        + convert(varchar(10), a.daily_commit_id) + " "
        + "'" + convert(varchar(19), a.commit_date, 23) + "." + substring(convert(varchar(15), a.commit_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.commit_status_id)
    )
from
    inserted a

go
