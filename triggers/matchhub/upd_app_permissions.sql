
if object_id("upd_app_permissions") != NULL
    drop trigger
        upd_app_permissions
go

create trigger
    upd_app_permissions
on
    app_permissions
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permissions: update "
        + convert(varchar(10), a.app_permission_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
