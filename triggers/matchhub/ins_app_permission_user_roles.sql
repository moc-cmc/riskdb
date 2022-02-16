
if object_id("ins_app_permission_user_roles") != NULL
    drop trigger
        ins_app_permission_user_roles
go

create trigger
    ins_app_permission_user_roles
on
    app_permission_user_roles
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permission_user_roles: insert "
        + convert(varchar(10), a.app_permission_id) + " "
        + convert(varchar(10), a.user_role_id)
    )
from
    inserted a

go
