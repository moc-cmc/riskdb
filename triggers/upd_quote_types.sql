
if object_id("upd_quote_types") != NULL
    drop trigger
        upd_quote_types
go

create trigger
    upd_quote_types
on
    quote_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".quote_types: update "
        + convert(varchar(10), a.quote_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go

