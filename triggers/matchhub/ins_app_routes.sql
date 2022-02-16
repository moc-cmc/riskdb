
if object_id("ins_app_routes") != NULL
    drop trigger
        ins_app_routes
go

create trigger
    ins_app_routes
on
    app_routes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_routes: insert "
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
