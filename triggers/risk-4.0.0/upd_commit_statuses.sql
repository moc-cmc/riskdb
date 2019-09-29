
if object_id("upd_commit_statuses") != NULL
    drop trigger
        upd_commit_statuses
go

create trigger
    upd_commit_statuses
on
    commit_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".commit_statuses: update "
        + convert(varchar(10), a.commit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
