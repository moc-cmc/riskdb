
if object_id("del_nop_types") != NULL
    drop trigger
        del_nop_types
go

create trigger
    del_nop_types
on
    nop_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".nop_types: delete "
        + convert(varchar(10), a.nop_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "'"
    )
from
    deleted a

go
