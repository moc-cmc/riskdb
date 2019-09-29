
if object_id("del_timezones") != NULL
    drop trigger
        del_timezones
go

create trigger
    del_timezones
on
    timezones
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".timezones: delete "
        + convert(varchar(10), a.timezone_id) + " "
        + "'" + str_replace(a.timezone, "'", "\'") + "' "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + str_replace(a.expiration_time, "'", "\'") + "' "
        + "'" + str_replace(a.display_value, "'", "\'") + "' "
        + convert(varchar(10), a.status)
    )
from
    deleted a

go
