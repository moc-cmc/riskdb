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
        + convert(varchar(10), source_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), status_id)
    )
from
    deleted

go