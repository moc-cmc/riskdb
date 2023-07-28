
if object_id("ins_address_types") != NULL
    drop trigger
        ins_address_types
go

create trigger
    ins_address_types
on
    address_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".address_types: insert "
        + convert(varchar(10), a.address_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
