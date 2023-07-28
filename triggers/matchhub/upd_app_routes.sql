
if object_id("upd_app_routes") != NULL
    drop trigger
        upd_app_routes
go

create trigger
    upd_app_routes
on
    app_routes
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_routes: update "
        + convert(varchar(10), a.app_route_id) + " "
        + convert(varchar(10), a.lft) + " "
        + convert(varchar(10), a.rgt) + " "
        + convert(varchar(10), a.parent_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + str_replace(a.slug, "'", "\'") + "' "
        + convert(varchar(10), a.app_route_type_id) + " "
        + (case when a.impl = NULL then "NULL" else "'" + str_replace(a.impl, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.app_permission_id) + " "
        + convert(varchar(10), a.app_route_status_id)
    )
from
    inserted a

go
