
if object_id("del_app_route_statuses") != NULL
    drop trigger
        del_app_route_statuses
go

create trigger
    del_app_route_statuses
on
    app_route_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_route_statuses: delete "
        + convert(varchar(10), a.app_route_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
