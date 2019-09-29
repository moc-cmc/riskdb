
if object_id("ins_commit_statuses") != NULL
    drop trigger
        ins_commit_statuses
go

create trigger
    ins_commit_statuses
on
    commit_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".commit_statuses: insert "
        + convert(varchar(10), a.commit_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
