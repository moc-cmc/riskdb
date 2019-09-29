
if object_id("ins_future_types") != NULL
    drop trigger
        ins_future_types
go

create trigger
    ins_future_types
on
    future_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".future_types: insert "
        + convert(varchar(10), a.future_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
