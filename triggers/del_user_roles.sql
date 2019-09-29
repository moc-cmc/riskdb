
if object_id("del_user_roles") != NULL
    drop trigger
        del_user_roles
go

create trigger
    del_user_roles
on
    user_roles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_roles: delete "
        + convert(varchar(10), a.user_role_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.system, "'", "\'")) + "'"
    )
from
    deleted a

go
