
if object_id("ins_geo_locations") != NULL
    drop trigger
        ins_geo_locations
go

create trigger
    ins_geo_locations
on
    geo_locations
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_locations: insert "
        + convert(varchar(10), a.geo_location_id) + " "
        + convert(varchar(50), a.latitude) + " "
        + convert(varchar(50), a.longitude) + " "
        + (case when a.street = NULL then "NULL" else "'" + str_replace(a.street, "'", "\'") + "'" end) + " "
        + (case when a.zipcode = NULL then "NULL" else "'" + str_replace(a.zipcode, "'", "\'") + "'" end) + " "
        + (case when a.geo_city_id = NULL then "NULL" else convert(varchar(10), a.geo_city_id) end) + " "
        + (case when a.geo_timezone_id = NULL then "NULL" else convert(varchar(10), a.geo_timezone_id) end)
    )
from
    inserted a

go
