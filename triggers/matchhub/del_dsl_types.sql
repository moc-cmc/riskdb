
if object_id("del_dsl_types") != NULL
    drop trigger
        del_dsl_types
go

create trigger
    del_dsl_types
on
    dsl_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dsl_types: delete "
        + convert(varchar(10), a.dsl_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "'"
    )
from
    deleted a

go
