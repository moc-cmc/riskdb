if object_id("ins_sources") != NULL
    drop trigger
        ins_sources
go

create trigger
    ins_sources
on
    sources
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".sources: insert "
        + convert(varchar(10), source_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), status_id)
    )
from
    inserted

go