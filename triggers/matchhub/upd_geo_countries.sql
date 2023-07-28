
if object_id("upd_geo_countries") != NULL
    drop trigger
        upd_geo_countries
go

create trigger
    upd_geo_countries
on
    geo_countries
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_countries: update "
        + convert(varchar(10), a.geo_country_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.code, "'", "\'") + "'"
    )
from
    inserted a

go
