
if object_id("del_ip_addresses") != NULL
    drop trigger
        del_ip_addresses
go

create trigger
    del_ip_addresses
on
    ip_addresses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ip_addresses: delete "
        + convert(varchar(10), a.ip_address_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.geo_location_id = NULL then "NULL" else convert(varchar(10), a.geo_location_id) end)
    )
from
    deleted a

go
