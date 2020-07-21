if object_id("ins_quote_types") != NULL
    drop trigger
        ins_quote_types
go

create trigger
    ins_quote_types
on
    quote_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".quote_types: insert "
        + convert(varchar(10), a.quote_type_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go

