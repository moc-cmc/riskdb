
if object_id("del_app_permissions") != NULL
    drop trigger
        del_app_permissions
go

create trigger
    del_app_permissions
on
    app_permissions
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permissions: delete "
        + convert(varchar(10), a.app_permission_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
