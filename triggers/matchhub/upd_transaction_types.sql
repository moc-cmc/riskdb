
if object_id("upd_transaction_types") != NULL
    drop trigger
        upd_transaction_types
go

create trigger
    upd_transaction_types
on
    transaction_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".transaction_types: update "
        + convert(varchar(10), a.transaction_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.direction)
    )
from
    inserted a

go
