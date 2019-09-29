
if object_id("del_statuses") != NULL
    drop trigger
        del_statuses
go

create trigger
    del_statuses
on
    statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".statuses: delete "
        + convert(varchar(10), a.status_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
