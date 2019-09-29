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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sources: update "
        + convert(varchar(10), source_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), status_id)
    )
from
    inserted

go