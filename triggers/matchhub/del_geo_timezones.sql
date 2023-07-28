
if object_id("del_geo_timezones") != NULL
    drop trigger
        del_geo_timezones
go

create trigger
    del_geo_timezones
on
    geo_timezones
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_timezones: delete "
        + convert(varchar(10), a.geo_timezone_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
