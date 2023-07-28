
if object_id("upd_app_route_types") != NULL
    drop trigger
        upd_app_route_types
go

create trigger
    upd_app_route_types
on
    app_route_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_route_types: update "
        + convert(varchar(10), a.app_route_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.system, "'", "\'")) + "'"
    )
from
    inserted a

go
