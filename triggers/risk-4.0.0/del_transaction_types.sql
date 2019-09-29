
if object_id("del_transaction_types") != NULL
    drop trigger
        del_transaction_types
go

create trigger
    del_transaction_types
on
    transaction_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".transaction_types: delete "
        + convert(varchar(10), a.transaction_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.direction)
    )
from
    deleted a

go
