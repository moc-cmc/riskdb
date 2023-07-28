
if object_id("upd_timezones") != NULL
    drop trigger
        upd_timezones
go

create trigger
    upd_timezones
on
    timezones
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".timezones: update "
        + convert(varchar(10), a.timezone_id) + " "
        + "'" + str_replace(a.timezone, "'", "\'") + "' "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + str_replace(a.expiration_time, "'", "\'") + "' "
        + "'" + str_replace(a.display_value, "'", "\'") + "' "
        + convert(varchar(10), a.status)
    )
from
    inserted a

go
