
if object_id("upd_user_role_users") != NULL
    drop trigger
        upd_user_role_users
go

create trigger
    upd_user_role_users
on
    user_role_users
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_role_users: update "
        + convert(varchar(10), a.user_role_id) + " "
        + convert(varchar(10), a.user_id)
    )
from
    inserted a

go
