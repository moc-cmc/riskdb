
if object_id("del_user_role_users") != NULL
    drop trigger
        del_user_role_users
go

create trigger
    del_user_role_users
on
    user_role_users
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_role_users: delete "
        + convert(varchar(10), a.user_role_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    deleted a

go
