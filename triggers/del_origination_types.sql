
if object_id("del_origination_types") != NULL
    drop trigger
        del_origination_types
go

create trigger
    del_origination_types
on
    origination_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".origination_types: delete "
        + convert(varchar(10), a.origination_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
