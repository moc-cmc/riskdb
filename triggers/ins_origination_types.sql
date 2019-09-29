
if object_id("ins_origination_types") != NULL
    drop trigger
        ins_origination_types
go

create trigger
    ins_origination_types
on
    origination_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".origination_types: insert "
        + convert(varchar(10), a.origination_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
