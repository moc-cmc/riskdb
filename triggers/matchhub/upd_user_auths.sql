
if object_id("upd_user_auths") != NULL
    drop trigger
        upd_user_auths
go

create trigger
    upd_user_auths
on
    user_auths
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_auths: update "
        + convert(varchar(10), a.user_auth_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.user_auth_type_id) + " "
        + "'" + str_replace(a.secret, "'", "\'") + "' "
        + (case when a.user_device_id = NULL then "NULL" else convert(varchar(10), a.user_device_id) end) + " "
        + "'" + convert(varchar(19), a.expire_date, 23) + "." + substring(convert(varchar(15), a.expire_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
