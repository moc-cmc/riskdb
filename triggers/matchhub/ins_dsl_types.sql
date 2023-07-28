
if object_id("ins_dsl_types") != NULL
    drop trigger
        ins_dsl_types
go

create trigger
    ins_dsl_types
on
    dsl_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dsl_types: insert "
        + convert(varchar(10), a.dsl_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.incl_longs, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_shorts, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.incl_base_ccy, "'", "\'")) + "'"
    )
from
    inserted a

go
