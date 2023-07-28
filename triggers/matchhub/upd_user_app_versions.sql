
if object_id("upd_user_app_versions") != NULL
    drop trigger
        upd_user_app_versions
go

create trigger
    upd_user_app_versions
on
    user_app_versions
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_app_versions: update "
        + convert(varchar(10), a.user_app_version_id) + " "
        + convert(varchar(10), a.user_app_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
