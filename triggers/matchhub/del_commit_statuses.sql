
if object_id("del_commit_statuses") != NULL
    drop trigger
        del_commit_statuses
go

create trigger
    del_commit_statuses
on
    commit_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".commit_statuses: delete "
        + convert(varchar(10), a.commit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
