
if object_id("ins_user_role_users") != NULL
    drop trigger
        ins_user_role_users
go

create trigger
    ins_user_role_users
on
    user_role_users
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_role_users: insert "
        + convert(varchar(10), a.user_role_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    inserted a

go
