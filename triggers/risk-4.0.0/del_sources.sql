
if object_id("del_sources") != NULL
    drop trigger
        del_sources
go

create trigger
    del_sources
on
    sources
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sources: delete "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.status_id) + " "
        + (case when a.source_type_id = NULL then "NULL" else convert(varchar(10), a.source_type_id) end)
    )
from
    deleted a

go
