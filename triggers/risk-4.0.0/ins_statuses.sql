
if object_id("ins_statuses") != NULL
    drop trigger
        ins_statuses
go

create trigger
    ins_statuses
on
    statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".statuses: insert "
        + convert(varchar(10), a.status_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
