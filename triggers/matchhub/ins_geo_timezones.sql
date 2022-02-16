
if object_id("ins_geo_timezones") != NULL
    drop trigger
        ins_geo_timezones
go

create trigger
    ins_geo_timezones
on
    geo_timezones
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_timezones: insert "
        + convert(varchar(10), a.geo_timezone_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
