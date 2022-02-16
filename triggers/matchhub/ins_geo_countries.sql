
if object_id("ins_geo_countries") != NULL
    drop trigger
        ins_geo_countries
go

create trigger
    ins_geo_countries
on
    geo_countries
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_countries: insert "
        + convert(varchar(10), a.geo_country_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.code, "'", "\'") + "'"
    )
from
    inserted a

go
