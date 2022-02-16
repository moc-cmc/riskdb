
if object_id("upd_app_route_statuses") != NULL
    drop trigger
        upd_app_route_statuses
go

create trigger
    upd_app_route_statuses
on
    app_route_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_route_statuses: update "
        + convert(varchar(10), a.app_route_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
