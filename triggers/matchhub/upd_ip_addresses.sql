
if object_id("upd_ip_addresses") != NULL
    drop trigger
        upd_ip_addresses
go

create trigger
    upd_ip_addresses
on
    ip_addresses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ip_addresses: update "
        + convert(varchar(10), a.ip_address_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.geo_location_id = NULL then "NULL" else convert(varchar(10), a.geo_location_id) end)
    )
from
    inserted a

go
