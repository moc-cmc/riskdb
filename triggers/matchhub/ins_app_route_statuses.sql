
if object_id("ins_app_route_statuses") != NULL
    drop trigger
        ins_app_route_statuses
go

create trigger
    ins_app_route_statuses
on
    app_route_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_route_statuses: insert "
        + convert(varchar(10), a.app_route_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
