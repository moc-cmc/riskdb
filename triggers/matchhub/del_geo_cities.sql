
if object_id("del_geo_cities") != NULL
    drop trigger
        del_geo_cities
go

create trigger
    del_geo_cities
on
    geo_cities
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_cities: delete "
        + convert(varchar(10), a.geo_city_id) + " "
        + convert(varchar(10), a.geo_region_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
