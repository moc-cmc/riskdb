
if object_id("upd_app_permission_user_roles") != NULL
    drop trigger
        upd_app_permission_user_roles
go

create trigger
    upd_app_permission_user_roles
on
    app_permission_user_roles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permission_user_roles: update "
        + convert(varchar(10), a.app_permission_id) + " "
        + convert(varchar(10), a.user_role_id)
    )
from
    inserted a

go
