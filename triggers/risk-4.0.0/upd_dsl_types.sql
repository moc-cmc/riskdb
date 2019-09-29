
if object_id("upd_dsl_types") != NULL
    drop trigger
        upd_dsl_types
go

create trigger
    upd_dsl_types
on
    dsl_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dsl_types: update "
        + convert(varchar(10), a.dsl_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "'"
    )
from
    inserted a

go
