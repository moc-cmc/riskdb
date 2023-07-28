
if object_id("del_source_types") != NULL
    drop trigger
        del_source_types
go

create trigger
    del_source_types
on
    source_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".source_types: delete "
        + convert(varchar(10), a.source_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
