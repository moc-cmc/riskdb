
if object_id("upd_sources") != NULL
    drop trigger
        upd_sources
go

create trigger
    upd_sources
on
    sources
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sources: update "
        + convert(varchar(10), a.source_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.status_id) + " "
        + (case when a.source_type_id = NULL then "NULL" else convert(varchar(10), a.source_type_id) end)
    )
from
    inserted a

go
