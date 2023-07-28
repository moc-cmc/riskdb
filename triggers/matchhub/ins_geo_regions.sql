
if object_id("ins_geo_regions") != NULL
    drop trigger
        ins_geo_regions
go

create trigger
    ins_geo_regions
on
    geo_regions
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".geo_regions: insert "
        + convert(varchar(10), a.geo_region_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.code, "'", "\'") + "' "
        + convert(varchar(10), a.geo_country_id)
    )
from
    inserted a

go
