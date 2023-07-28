
if object_id("del_address_types") != NULL
    drop trigger
        del_address_types
go

create trigger
    del_address_types
on
    address_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".address_types: delete "
        + convert(varchar(10), a.address_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
