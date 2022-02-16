
if object_id("upd_user_apps") != NULL
    drop trigger
        upd_user_apps
go

create trigger
    upd_user_apps
on
    user_apps
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_apps: update "
        + convert(varchar(10), a.user_app_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
