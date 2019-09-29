
if object_id("upd_statuses") != NULL
    drop trigger
        upd_statuses
go

create trigger
    upd_statuses
on
    statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".statuses: update "
        + convert(varchar(10), a.status_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
