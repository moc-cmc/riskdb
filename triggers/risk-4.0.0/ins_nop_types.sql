
if object_id("ins_nop_types") != NULL
    drop trigger
        ins_nop_types
go

create trigger
    ins_nop_types
on
    nop_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".nop_types: insert "
        + convert(varchar(10), a.nop_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_fixed_ndfs, "'", "\'")) + "'"
    )
from
    inserted a

go
