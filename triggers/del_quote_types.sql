
if object_id("del_quote_types") != NULL
    drop trigger
        del_quote_types
go

create trigger
    del_quote_types
on
    quote_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".quote_types: delete "
        + convert(varchar(10), a.quote_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go

