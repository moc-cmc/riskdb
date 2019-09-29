
if object_id("upd_origination_types") != NULL
    drop trigger
        upd_origination_types
go

create trigger
    upd_origination_types
on
    origination_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".origination_types: update "
        + convert(varchar(10), a.origination_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
