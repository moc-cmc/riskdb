
if object_id("del_geo_countries") != NULL
    drop trigger
        del_geo_countries
go

create trigger
    del_geo_countries
on
    geo_countries
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_countries: delete "
        + convert(varchar(10), a.geo_country_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.code, "'", "\'") + "'"
    )
from
    deleted a

go
