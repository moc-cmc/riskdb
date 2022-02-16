
if object_id("upd_instruments") != NULL
    drop trigger
        upd_instruments
go

create trigger
    upd_instruments
on
    instruments
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".instruments: update "
        + convert(varchar(10), a.instrument_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
