
if object_id("del_app_route_types") != NULL
    drop trigger
        del_app_route_types
go

create trigger
    del_app_route_types
on
    app_route_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_route_types: delete "
        + convert(varchar(10), a.app_route_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.system, "'", "\'")) + "'"
    )
from
    deleted a

go
