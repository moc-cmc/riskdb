
if object_id("upd_nop_types") != NULL
    drop trigger
        upd_nop_types
go

create trigger
    upd_nop_types
on
    nop_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".nop_types: update "
        + convert(varchar(10), a.nop_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "'"
    )
from
    inserted a

go
