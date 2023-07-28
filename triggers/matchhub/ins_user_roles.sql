
if object_id("ins_user_roles") != NULL
    drop trigger
        ins_user_roles
go

create trigger
    ins_user_roles
on
    user_roles
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_roles: insert "
        + convert(varchar(10), a.user_role_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.system, "'", "\'")) + "'"
    )
from
    inserted a

go
