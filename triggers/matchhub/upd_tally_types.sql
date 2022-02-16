
if object_id("upd_tally_types") != NULL
    drop trigger
        upd_tally_types
go

create trigger
    upd_tally_types
on
    tally_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tally_types: update "
        + convert(varchar(10), a.tally_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
