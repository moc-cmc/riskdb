
if object_id("upd_source_types") != NULL
    drop trigger
        upd_source_types
go

create trigger
    upd_source_types
on
    source_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".source_types: update "
        + convert(varchar(10), a.source_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
