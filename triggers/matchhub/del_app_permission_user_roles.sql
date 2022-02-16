
if object_id("del_app_permission_user_roles") != NULL
    drop trigger
        del_app_permission_user_roles
go

create trigger
    del_app_permission_user_roles
on
    app_permission_user_roles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permission_user_roles: delete "
        + convert(varchar(10), a.app_permission_id) + " "
        + convert(varchar(10), a.user_role_id)
    )
from
    deleted a

go
