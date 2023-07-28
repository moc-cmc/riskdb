
if object_id("ins_instruments") != NULL
    drop trigger
        ins_instruments
go

create trigger
    ins_instruments
on
    instruments
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".instruments: insert "
        + convert(varchar(10), a.instrument_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
