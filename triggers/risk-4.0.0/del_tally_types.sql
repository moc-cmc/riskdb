
if object_id("del_tally_types") != NULL
    drop trigger
        del_tally_types
go

create trigger
    del_tally_types
on
    tally_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tally_types: delete "
        + convert(varchar(10), a.tally_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
